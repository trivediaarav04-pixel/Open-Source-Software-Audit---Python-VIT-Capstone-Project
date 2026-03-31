#!/bin/bash
# ============================================================
# Script 3: Disk and Permission Auditor
# Author: [Aarav Trivedi] | Roll: [24BAI10671]
# Course: Open Source Software | Software Audited: Python
# Description: Loops through important Linux system directories
#              and reports their size, owner, and permissions.
#              Also checks Python's specific config directory.
# ============================================================

# --- List of system directories to audit ---
# This is a bash array — values stored inside ( ) separated by spaces
DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp" "/usr/lib/python3")

# ============================================================
# SECTION 1: Directory Audit Loop
# ============================================================
# A 'for' loop repeats the same block of code for each item
# "${DIRS[@]}" means "all elements of the DIRS array"

echo "=============================================="
echo "   DISK AND PERMISSION AUDITOR"
echo "=============================================="
echo ""
echo "Auditing system directories..."
echo "----------------------------------------------"
printf "%-20s %-12s %-30s\n" "Directory" "Size" "Permissions / Owner"
echo "----------------------------------------------"

for DIR in "${DIRS[@]}"; do

    # Check if the directory actually exists before auditing it
    # '-d' means "is this a directory?"
    if [ -d "$DIR" ]; then

        # Get permissions and ownership using ls -ld
        # awk extracts specific fields from the output:
        # $1 = permissions, $3 = owner, $4 = group
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        GROUP=$(ls -ld "$DIR" | awk '{print $4}')

        # Get directory size using du (disk usage)
        # -s means summary (total only), -h means human-readable (KB, MB, GB)
        # 2>/dev/null hides permission errors
        # cut -f1 extracts just the size number
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)

        # printf formats output into neat columns
        # %-20s means left-aligned text in a 20-character wide column
        printf "%-20s %-12s %-30s\n" "$DIR" "$SIZE" "$PERMS $OWNER:$GROUP"

    else
        # Directory does not exist on this system
        printf "%-20s %-12s %-30s\n" "$DIR" "N/A" "Directory does not exist"
    fi

done

echo ""

# ============================================================
# SECTION 2: Detailed view of key Python directories
# ============================================================
# This section gives a deeper look at Python-specific paths
# These are the directories where Python lives on Linux

echo "----------------------------------------------"
echo "Python-specific Directory Details:"
echo "----------------------------------------------"
echo ""

# Array of Python-related paths to check
PYTHON_DIRS=("/usr/bin/python3" "/usr/lib/python3" "/etc/python3" "/usr/local/lib")

for PYDIR in "${PYTHON_DIRS[@]}"; do

    # Check if the path exists (works for both files and directories)
    # '-e' means "does this path exist?"
    if [ -e "$PYDIR" ]; then
        echo "  Path     : $PYDIR"

        # Get full permission details
        PERMS=$(ls -ld "$PYDIR" | awk '{print $1}')
        OWNER=$(ls -ld "$PYDIR" | awk '{print $3}')
        GROUP=$(ls -ld "$PYDIR" | awk '{print $4}')

        echo "  Permissions : $PERMS"
        echo "  Owner       : $OWNER"
        echo "  Group       : $GROUP"
        echo ""
    else
        echo "  Path : $PYDIR — not found on this system"
        echo ""
    fi
done

# ============================================================
# SECTION 3: Explain what permissions mean
# ============================================================
# This section prints a legend explaining Linux permission codes
# It demonstrates string output and formatted echo statements

echo "----------------------------------------------"
echo "Understanding Linux Permissions:"
echo "----------------------------------------------"
echo ""
echo "  Permission string format: [type][owner][group][others]"
echo "  Example: drwxr-xr-x"
echo ""
echo "  d = directory, - = file, l = symbolic link"
echo "  r = read, w = write, x = execute, - = no permission"
echo ""
echo "  Why this matters for open source:"
echo "  Linux uses permissions to control who can read,"
echo "  modify, or run files. This is a core part of"
echo "  the security model that open-source systems"
echo "  like Linux and Python rely on."
echo ""
echo "=============================================="
echo "  End of Disk and Permission Auditor"
echo "=============================================="
