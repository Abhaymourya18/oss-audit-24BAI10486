#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: Abhay Mourya | Roll No: 24BAI10486
# Course: Open Source Software | Chosen Software: Git
# Description: Displays a welcome screen with system info
#              and the open-source license of the OS.
# ============================================================

# --- Student Info Variables ---
STUDENT_NAME="Abhay Mourya"
ROLL_NO="24BAI10486"
SOFTWARE_CHOICE="Git"

# --- Gather System Information using command substitution $() ---
DISTRO=$(cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')
KERNEL=$(uname -r)                        # Kernel version
USER_NAME=$(whoami)                       # Current logged-in user
HOME_DIR=$HOME                            # Home directory of current user
UPTIME=$(uptime -p)                       # Human-readable uptime
CURRENT_DATE=$(date '+%A, %d %B %Y')     # Formatted date
CURRENT_TIME=$(date '+%H:%M:%S')          # Current time

# --- Display the System Identity Report ---
echo "============================================================"
echo "         OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT        "
echo "============================================================"
echo ""
echo "  Student  : $STUDENT_NAME"
echo "  Roll No  : $ROLL_NO"
echo "  Software : $SOFTWARE_CHOICE"
echo ""
echo "------------------------------------------------------------"
echo "  SYSTEM INFORMATION"
echo "------------------------------------------------------------"
echo "  Distribution : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  Logged User  : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo "  Uptime       : $UPTIME"
echo "  Date         : $CURRENT_DATE"
echo "  Time         : $CURRENT_TIME"
echo ""
echo "------------------------------------------------------------"
echo "  OPEN SOURCE LICENSE"
echo "------------------------------------------------------------"

# --- Use a case statement to identify the OS and its license ---
# Extract the distro ID for matching
OS_ID=$(cat /etc/os-release | grep "^ID=" | cut -d= -f2 | tr -d '"' | tr '[:upper:]' '[:lower:]')

case $OS_ID in
  ubuntu|debian)
    echo "  This OS ($DISTRO) is distributed under the"
    echo "  GNU General Public License v2 (GPL v2)."
    ;;
  fedora|rhel|centos)
    echo "  This OS ($DISTRO) is distributed under the"
    echo "  GNU General Public License v2 (GPL v2)."
    ;;
  arch|manjaro)
    echo "  This OS ($DISTRO) is distributed under the"
    echo "  GNU General Public License v2 (GPL v2)."
    ;;
  *)
    echo "  This OS ($DISTRO) is based on Linux, which is"
    echo "  distributed under the GNU General Public License v2 (GPL v2)."
    ;;
esac

echo ""
echo "  Git itself is also licensed under GPL v2."
echo "  'Free as in freedom' — you can use, study,"
echo "  modify, and share this software freely."
echo ""
echo "============================================================"
echo "  End of System Identity Report"
echo "============================================================"
