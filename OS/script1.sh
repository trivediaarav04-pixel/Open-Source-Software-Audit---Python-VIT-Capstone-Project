#!/bin/bash
# ============================================================
# Script 1: System Identity Report
# Author: [Aarav Trivedi] | Roll: [24BAI10671]
# Course: Open Source Software | Software Audited: Python
# Description: Displays system information like a welcome
#              screen, including OS, kernel, user, uptime,
#              and the open-source license of the OS.
# ============================================================

# --- Variables ---
# Variables store values we want to reuse. Format: NAME="value"
STUDENT_NAME="Aarav Trivedi"        # Replace with your name
ROLL_NUMBER="24BAI10671"              # Replace with your roll number
SOFTWARE_CHOICE="Python"            # The software we are auditing
OS_LICENSE="GNU General Public License v2 (GPLv2)"  # Linux kernel license

# --- Gather system information using command substitution ---
# $(...) runs a command and captures its output as a value
KERNEL=$(uname -r)                  # Gets the Linux kernel version
USER_NAME=$(whoami)                 # Gets the currently logged-in username
HOME_DIR=$(echo $HOME)              # Gets the home directory path
UPTIME=$(uptime -p)                 # Gets human-readable uptime e.g. "up 2 hours"
CURRENT_DATE=$(date '+%d %B %Y')    # Gets date formatted as: 25 March 2025
CURRENT_TIME=$(date '+%H:%M:%S')    # Gets time formatted as: 14:30:00

# --- Get the Linux distribution name ---
# /etc/os-release is a file that contains OS information
# 'grep' searches for a line, 'cut' extracts part of it
DISTRO=$(grep "^PRETTY_NAME" /etc/os-release | cut -d '"' -f2)

# --- Display the report ---
# echo prints text to the screen
echo "=============================================="
echo "   OPEN SOURCE AUDIT — SYSTEM IDENTITY REPORT"
echo "=============================================="
echo ""
echo "  Student   : $STUDENT_NAME"
echo "  Roll No   : $ROLL_NUMBER"
echo "  Software  : $SOFTWARE_CHOICE"
echo ""
echo "----------------------------------------------"
echo "  SYSTEM INFORMATION"
echo "----------------------------------------------"
echo ""
echo "  OS / Distro  : $DISTRO"
echo "  Kernel       : $KERNEL"
echo "  Logged in as : $USER_NAME"
echo "  Home Dir     : $HOME_DIR"
echo ""
echo "----------------------------------------------"
echo "  DATE & TIME"
echo "----------------------------------------------"
echo ""
echo "  Date   : $CURRENT_DATE"
echo "  Time   : $CURRENT_TIME"
echo "  Uptime : $UPTIME"
echo ""
echo "----------------------------------------------"
echo "  OPEN SOURCE LICENSE INFO"
echo "----------------------------------------------"
echo ""
echo "  This system runs Linux."
echo "  Linux OS License : $OS_LICENSE"
echo ""
echo "  The Linux kernel is free software licensed"
echo "  under the GPLv2. This means anyone can view,"
echo "  modify, and distribute it — but must share"
echo "  changes under the same license."
echo ""
echo "  Software being audited : $SOFTWARE_CHOICE"
echo "  $SOFTWARE_CHOICE License : Python Software Foundation (PSF) License"
echo "  The PSF License is permissive — companies can"
echo "  use and modify Python without sharing changes."
echo ""
echo "=============================================="
echo "  End of System Identity Report"
echo "=============================================="
