#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: Abhay Mourya | Roll No: 24BAI10486
# Course: Open Source Software | Chosen Software: Git
# Description: Loops through key system directories and reports
#              their size, owner, and permissions. Also checks
#              Git's specific config directory.
# ============================================================

# --- List of important system directories to audit ---
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/var" "/usr")

echo "============================================================"
echo "         DISK AND PERMISSION AUDITOR"
echo "============================================================"
echo ""
echo "  Auditing key Linux system directories..."
echo ""
printf "  %-20s %-20s %-10s\n" "DIRECTORY" "PERMISSIONS/OWNER" "SIZE"
echo "  ------------------------------------------------------------"

# --- for loop: Iterate through each directory in the list ---
for DIR in "${DIRS[@]}"; do

    # Check if the directory exists before trying to inspect it
    if [ -d "$DIR" ]; then
        # Extract permissions and owner using ls and awk
        # ls -ld gives: permissions links owner group size date name
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')   # e.g. drwxr-xr-x
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')   # e.g. root
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')   # e.g. root

        # Get human-readable directory size; suppress permission errors
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # Print formatted row
        printf "  %-20s %-20s %-10s\n" "$DIR" "$PERMS ($OWNER:$GROUP)" "$SIZE"
    else
        # Directory doesn't exist on this system
        printf "  %-20s %-20s\n" "$DIR" "[DOES NOT EXIST]"
    fi

done

echo ""
echo "------------------------------------------------------------"
echo "  GIT-SPECIFIC DIRECTORY AUDIT"
echo "------------------------------------------------------------"
echo ""
echo "  Checking Git installation paths on this system..."
echo ""

# --- Array of Git-specific paths to check ---
GIT_PATHS=("/usr/bin/git" "/usr/lib/git-core" "/etc/gitconfig" "/usr/share/doc/git")

for GPATH in "${GIT_PATHS[@]}"; do
    if [ -e "$GPATH" ]; then
        # Use ls -ld for both files and directories
        PERMS=$(ls -ld "$GPATH" | awk '{print $1}')
        OWNER=$(ls -ld "$GPATH" | awk '{print $3":"$4}')
        echo "  FOUND    : $GPATH"
        echo "  Perms    : $PERMS"
        echo "  Owner    : $OWNER"
        echo ""
    else
        echo "  NOT FOUND: $GPATH (may vary by distro)"
        echo ""
    fi
done

# --- Check user-level Git config directory ---
echo "------------------------------------------------------------"
echo "  USER-LEVEL GIT CONFIG"
echo "------------------------------------------------------------"
echo ""

# $HOME is the current user's home directory
USER_GIT_CONFIG="$HOME/.gitconfig"
USER_GIT_DIR="$HOME/.config/git"

if [ -f "$USER_GIT_CONFIG" ]; then
    PERMS=$(ls -l "$USER_GIT_CONFIG" | awk '{print $1}')
    echo "  ~/.gitconfig found!"
    echo "  Permissions : $PERMS"
    echo "  Contents    :"
    # Display the git config file indented
    while IFS= read -r line; do
        echo "    $line"
    done < "$USER_GIT_CONFIG"
else
    echo "  ~/.gitconfig not found."
    echo "  You can create one with:"
    echo "    git config --global user.name  'Your Name'"
    echo "    git config --global user.email 'your@email.com'"
fi

echo ""
echo "============================================================"
echo "  WHY PERMISSIONS MATTER IN OPEN SOURCE"
echo "============================================================"
echo ""
echo "  Linux permissions protect system integrity."
echo "  Open-source software like Git runs as a regular user —"
echo "  NOT as root — which limits damage if something goes wrong."
echo "  This principle of 'least privilege' is a security best"
echo "  practice embraced by the FOSS community."
echo ""
echo "============================================================"
echo "  End of Disk and Permission Auditor"
echo "============================================================"
