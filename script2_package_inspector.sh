#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: Abhay Mourya | Roll No: 24BAI10486
# Course: Open Source Software | Chosen Software: Git
# Description: Checks if a FOSS package is installed, shows
#              its version/license, and prints a philosophy note.
# ============================================================

# --- Package to inspect (our chosen software is Git) ---
PACKAGE="git"

echo "============================================================"
echo "         FOSS PACKAGE INSPECTOR"
echo "============================================================"
echo ""
echo "  Inspecting package: $PACKAGE"
echo ""

# --- Detect package manager and check if package is installed ---
# Different Linux distros use different package managers

if command -v rpm &>/dev/null; then
    # RPM-based system (Fedora, RHEL, CentOS)
    PKG_MANAGER="rpm"
elif command -v dpkg &>/dev/null; then
    # Debian-based system (Ubuntu, Debian)
    PKG_MANAGER="dpkg"
else
    PKG_MANAGER="unknown"
fi

echo "  Detected package manager: $PKG_MANAGER"
echo ""
echo "------------------------------------------------------------"
echo "  INSTALLATION STATUS"
echo "------------------------------------------------------------"

# --- if-then-else: Check if git is installed ---
if command -v git &>/dev/null; then
    echo "  STATUS  : INSTALLED ✔"
    echo ""

    # Get version using git itself (works on all distros)
    GIT_VERSION=$(git --version | awk '{print $3}')
    echo "  Version : $GIT_VERSION"

    # Try to get more details based on package manager
    if [ "$PKG_MANAGER" = "rpm" ]; then
        echo ""
        echo "  RPM Package Details:"
        rpm -qi git 2>/dev/null | grep -E 'Version|License|Summary|URL' | \
        while IFS= read -r line; do
            echo "    $line"
        done

    elif [ "$PKG_MANAGER" = "dpkg" ]; then
        echo ""
        echo "  DPKG Package Details:"
        dpkg -l git 2>/dev/null | grep "^ii" | awk '{print "    Package: "$2"\n    Version: "$3}'
    fi

else
    # Package is NOT installed — give install instructions
    echo "  STATUS  : NOT INSTALLED ✗"
    echo ""
    echo "  To install Git, run one of the following:"
    echo "    Ubuntu/Debian : sudo apt install git"
    echo "    Fedora/RHEL   : sudo dnf install git"
    echo "    Arch Linux    : sudo pacman -S git"
fi

echo ""
echo "------------------------------------------------------------"
echo "  OPEN SOURCE PHILOSOPHY NOTE"
echo "------------------------------------------------------------"

# --- case statement: Print philosophy note based on package name ---
case $PACKAGE in
    git)
        echo "  Git — Version control born out of necessity."
        echo "  Linus Torvalds built Git in 2005 in just two weeks"
        echo "  after a proprietary tool (BitKeeper) revoked its free"
        echo "  license. Git is now the backbone of modern software"
        echo "  development worldwide. Licensed under GPL v2."
        ;;
    httpd|apache2)
        echo "  Apache HTTP Server — the web server that built the open internet."
        echo "  Powers nearly 30% of all websites globally. Apache 2.0 License."
        ;;
    mysql|mariadb)
        echo "  MySQL — open source at the heart of millions of apps."
        echo "  A dual-license story: GPL v2 for community, commercial for enterprise."
        ;;
    vlc)
        echo "  VLC — plays anything, built by students in Paris."
        echo "  A gift to the world from VideoLAN. Licensed under LGPL/GPL."
        ;;
    firefox)
        echo "  Firefox — a nonprofit fighting for an open web."
        echo "  Mozilla's answer to browser monopoly. Licensed under MPL 2.0."
        ;;
    python3|python)
        echo "  Python — a language shaped entirely by community."
        echo "  Guided by the Python Software Foundation. PSF License."
        ;;
    *)
        echo "  '$PACKAGE' is part of the FOSS ecosystem — software"
        echo "  built openly and shared freely for the benefit of all."
        ;;
esac

echo ""
echo "============================================================"
echo "  End of FOSS Package Inspector"
echo "============================================================"
