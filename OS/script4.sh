#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: [Aarav Trivedi] | Roll: [24BAI10671]
# Course: Open Source Software | Software Audited: Python
# Description: Reads a log file line by line, counts how many
#              lines contain a keyword, prints a summary, and
#              displays the last 5 matching lines.
# Usage: ./script4.sh /var/log/syslog error
# ============================================================

# ============================================================
# SECTION 1: Handle command-line arguments
# ============================================================
# $1 means the first argument the user types after the script name
# $2 means the second argument
# Example: ./script4.sh /var/log/syslog error
#          $1 = /var/log/syslog
#          $2 = error

LOGFILE=$1                    # First argument: path to the log file
KEYWORD=${2:-"error"}         # Second argument: keyword to search for
                              # ${2:-"error"} means: use $2 if given,
                              # otherwise use "error" as the default

# ============================================================
# SECTION 2: Validate the log file
# ============================================================
# Before reading the file, we check if it actually exists
# '-f' means "is this a regular file?"

echo "=============================================="
echo "   LOG FILE ANALYZER"
echo "=============================================="
echo ""

# Check if user provided a filename at all
if [ -z "$LOGFILE" ]; then
    # '-z' means "is this string empty?"
    echo "ERROR: No log file specified."
    echo "Usage: ./script4.sh <logfile> <keyword>"
    echo "Example: ./script4.sh /var/log/syslog error"
    exit 1      # exit 1 stops the script with an error code
fi

# Check if the file exists
if [ ! -f "$LOGFILE" ]; then
    # '!' means NOT, so '! -f' means "does NOT exist as a file"
    echo "ERROR: File '$LOGFILE' not found."
    echo "Please check the path and try again."
    exit 1
fi

# Check if the file is empty
if [ ! -s "$LOGFILE" ]; then
    # '-s' means "file has size greater than zero"
    # '! -s' means file IS empty
    echo "WARNING: File '$LOGFILE' is empty."
    echo "Please provide a log file that has content."
    exit 1
fi

# If we reach here, the file exists and has content
echo "  Log file : $LOGFILE"
echo "  Keyword  : $KEYWORD"
echo ""

# ============================================================
# SECTION 3: Count keyword occurrences using while read loop
# ============================================================
# 'while read' reads the file one line at a time
# Each line is stored in the variable LINE
# We check each line for the keyword and count matches

COUNT=0           # Counter variable — starts at zero
MATCH_FOUND=0     # Flag to track if any match was found at all

echo "----------------------------------------------"
echo "Scanning file for keyword: '$KEYWORD'"
echo "----------------------------------------------"

# IFS= preserves whitespace in each line
# read -r prevents backslash from being interpreted
# < "$LOGFILE" feeds the file into the while loop
while IFS= read -r LINE; do

    # grep -iq checks if LINE contains KEYWORD
    # -i means case-insensitive (matches ERROR, error, Error)
    # -q means quiet (no output, just true/false)
    if echo "$LINE" | grep -iq "$KEYWORD"; then

        # Increment counter by 1
        # $(( )) is arithmetic in bash
        COUNT=$((COUNT + 1))
        MATCH_FOUND=1
    fi

done < "$LOGFILE"

# ============================================================
# SECTION 4: Print the summary
# ============================================================

echo ""
echo "  Total lines scanned : $(wc -l < "$LOGFILE")"
echo "  Keyword '$KEYWORD' found : $COUNT times"
echo ""

# ============================================================
# SECTION 5: Show last 5 matching lines
# ============================================================
# grep searches the file for the keyword
# tail -5 takes only the last 5 matching results
# This gives the most recent occurrences

if [ $MATCH_FOUND -eq 1 ]; then
    # '-eq' means 'equal to' in numeric comparison
    echo "----------------------------------------------"
    echo "Last 5 lines containing '$KEYWORD':"
    echo "----------------------------------------------"
    echo ""

    # grep -i = case insensitive search in the file
    # tail -5 = show only the last 5 results
    grep -i "$KEYWORD" "$LOGFILE" | tail -5

    echo ""
else
    echo "  No lines containing '$KEYWORD' were found."
    echo ""
fi

# ============================================================
# SECTION 6: Keyword frequency summary
# ============================================================
# This gives a quick severity breakdown if multiple keywords
# are found — useful for real log analysis

echo "----------------------------------------------"
echo "Quick Severity Scan:"
echo "----------------------------------------------"
echo ""

# Array of common log keywords to check
LOG_KEYWORDS=("error" "warning" "info" "critical" "failed")

for KW in "${LOG_KEYWORDS[@]}"; do
    # Count occurrences of each keyword (case insensitive)
    KW_COUNT=$(grep -ic "$KW" "$LOGFILE" 2>/dev/null)

    # Only print if count is greater than 0
    if [ "$KW_COUNT" -gt 0 ]; then
        printf "  %-12s : %s occurrences\n" "$KW" "$KW_COUNT"
    fi
done

echo ""
echo "=============================================="
echo "  End of Log File Analyzer"
echo "=============================================="
