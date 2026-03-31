#!/bin/bash
# ============================================================
# Script 2: FOSS Package Inspector
# Author: [Aarav Trivedi] | Roll: [24BAI10671]
# Course: Open Source Software | Software Audited: Python
# Description: Checks whether Python and related FOSS packages
#              are installed, displays their details, and uses
#              a case statement to print a philosophy note
#              about each package.
# ============================================================

# --- The main package we are auditing ---
PACKAGE="python3"   # This is the package name as known to apt (Ubuntu's package manager)

# ============================================================
# SECTION 1: Check if the main package (Python) is installed
# ============================================================
# 'dpkg -l' lists all installed packages on Ubuntu/Debian systems
# 'grep -w' searches for an exact word match
# '&>/dev/null' hides all output — we only care if it succeeds or fails
# 'if' checks the result: if the command succeeded, package is installed

echo "=============================================="
echo "   FOSS PACKAGE INSPECTOR"
echo "=============================================="
echo ""
echo "Checking main audit package: $PACKAGE"
echo "----------------------------------------------"

if dpkg -l "$PACKAGE" &>/dev/null; then
    # Package is installed — show its details
    echo "STATUS   : $PACKAGE is INSTALLED on this system."
    echo ""

    # dpkg -s gives detailed info about a single package
    # grep -E filters lines matching Version, License, or Homepage
    echo "--- Package Details ---"
    dpkg -s "$PACKAGE" | grep -E "^Version|^Homepage"

    # Also show the Python version directly
    echo ""
    echo "--- Python Version Check ---"
    python3 --version

    # Show where Python is installed (its binary path)
    echo "--- Install Location ---"
    which python3

else
    # Package is NOT installed — inform the user
    echo "STATUS : $PACKAGE is NOT installed."
    echo "To install it, run: sudo apt install python3"
fi

echo ""

# ============================================================
# SECTION 2: Check additional related FOSS packages
# ============================================================
# We check a list of Python-related packages using a for loop
# These are all open-source tools in the Python ecosystem

echo "----------------------------------------------"
echo "Checking related FOSS packages:"
echo "----------------------------------------------"

# Define a list of related packages to check
RELATED_PACKAGES="python3-pip python3-venv git curl"

# Loop through each package in the list
for PKG in $RELATED_PACKAGES; do
    # Check if each package is installed
    if dpkg -l "$PKG" &>/dev/null; then
        echo "  $PKG => INSTALLED"
    else
        echo "  $PKG => NOT installed (run: sudo apt install $PKG)"
    fi
done

echo ""

# ============================================================
# SECTION 3: Case statement — philosophy note per package
# ============================================================
# A 'case' statement is like multiple if-else checks in one
# It matches the value of PACKAGE against a list of patterns
# Each pattern ends with ')' and its block ends with ';;'

echo "----------------------------------------------"
echo "Open Source Philosophy Notes:"
echo "----------------------------------------------"
echo ""

# We loop through all packages including the main one
ALL_PACKAGES="python3 python3-pip python3-venv git curl"

for PKG in $ALL_PACKAGES; do
    # case checks PKG against each option below
    case $PKG in
        python3)
            echo "  python3    : Born in 1989 from a desire for a language"
            echo "               that was open, readable, and community-driven."
            echo "               Licensed under the permissive PSF License."
            ;;
        python3-pip)
            echo "  pip        : The package installer that powers Python's"
            echo "               ecosystem of 500,000+ open-source libraries."
            ;;
        python3-venv)
            echo "  venv       : Allows isolated Python environments — a tool"
            echo "               that reflects open source's modular philosophy."
            ;;
        git)
            echo "  git        : Built by Linus Torvalds when proprietary tools"
            echo "               failed him. Now the backbone of open collaboration."
            ;;
        curl)
            echo "  curl       : A tiny open-source tool used by billions of"
            echo "               devices — proof that small tools matter."
            ;;
        *)
            # '*' is the default case — matches anything not listed above
            echo "  $PKG : An open-source tool in the Linux ecosystem."
            ;;
    esac
    echo ""
done

echo "=============================================="
echo "  End of FOSS Package Inspector"
echo "=============================================="
