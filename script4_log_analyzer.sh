#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author: Abhay Mourya | Roll No: 24BAI10486
# Course: Open Source Software | Chosen Software: Git
# Description: Reads a log file line by line, counts keyword
#              occurrences, and prints matching lines summary.
# Usage: ./script4_log_analyzer.sh <logfile> [keyword]
# Example: ./script4_log_analyzer.sh /var/log/syslog error
# ============================================================

# --- Command-line arguments ---
# $1 = log file path (required)
# $2 = keyword to search for (optional, default: "error")
LOGFILE=$1
KEYWORD=${2:-"error"}   # Default keyword is 'error' if not provided

# --- Counters ---
COUNT=0          # Count of lines matching keyword
TOTAL=0          # Total lines read

echo "============================================================"
echo "         LOG FILE ANALYZER"
echo "============================================================"
echo ""

# --- Validate that a log file argument was provided ---
if [ -z "$LOGFILE" ]; then
    echo "  ERROR: No log file specified."
    echo ""
    echo "  Usage : ./script4_log_analyzer.sh <logfile> [keyword]"
    echo "  Example: ./script4_log_analyzer.sh /var/log/syslog error"
    echo ""
    # Exit with error code 1
    exit 1
fi

# --- Check if the specified file exists ---
if [ ! -f "$LOGFILE" ]; then
    echo "  ERROR: File '$LOGFILE' not found."
    echo ""
    echo "  Common Linux log files to try:"
    echo "    /var/log/syslog      (Ubuntu/Debian)"
    echo "    /var/log/messages    (Fedora/RHEL)"
    echo "    /var/log/auth.log    (authentication logs)"
    echo "    /var/log/kern.log    (kernel logs)"
    echo ""
    exit 1
fi

# --- Check if the file is empty; retry logic ---
# This simulates a do-while style retry using a while loop
RETRY=0
MAX_RETRIES=3

while [ ! -s "$LOGFILE" ] && [ $RETRY -lt $MAX_RETRIES ]; do
    RETRY=$((RETRY + 1))
    echo "  WARNING: '$LOGFILE' appears to be empty."
    echo "  Retry attempt $RETRY of $MAX_RETRIES..."
    sleep 1   # Wait 1 second before retrying
done

# After retries, if still empty, warn and exit
if [ ! -s "$LOGFILE" ]; then
    echo "  File is empty after $MAX_RETRIES attempts. Exiting."
    exit 1
fi

echo "  Log File : $LOGFILE"
echo "  Keyword  : '$KEYWORD'"
echo ""
echo "------------------------------------------------------------"
echo "  SCANNING LOG FILE..."
echo "------------------------------------------------------------"
echo ""

# --- Temporary file to store matching lines ---
TMPFILE=$(mktemp /tmp/log_matches_XXXX.txt)

# --- while read loop: Read the log file line by line ---
while IFS= read -r LINE; do
    # Count total lines processed
    TOTAL=$((TOTAL + 1))

    # if-then: Check if current line contains the keyword (case-insensitive)
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))            # Increment match counter
        echo "$LINE" >> "$TMPFILE"      # Save matching line to temp file
    fi

done < "$LOGFILE"   # Redirect file as input to while loop

# --- Print Summary ---
echo "  Total lines scanned  : $TOTAL"
echo "  Lines matching '$KEYWORD' : $COUNT"
echo ""

# --- Show last 5 matching lines if any were found ---
if [ $COUNT -gt 0 ]; then
    echo "------------------------------------------------------------"
    echo "  LAST 5 MATCHING LINES (containing '$KEYWORD')"
    echo "------------------------------------------------------------"
    echo ""
    # Use tail to get last 5 lines from our temp file
    tail -5 "$TMPFILE" | while IFS= read -r MATCH_LINE; do
        echo "  >> $MATCH_LINE"
    done
    echo ""
else
    echo "  No lines containing '$KEYWORD' were found in the log."
    echo ""
fi

# --- Clean up the temporary file ---
rm -f "$TMPFILE"

# --- Git-specific note about logging ---
echo "============================================================"
echo "  OPEN SOURCE & LOGGING"
echo "============================================================"
echo ""
echo "  Git maintains its own operation logs in:"
echo "    ~/.git/logs/HEAD          — local commit history"
echo "    ~/.git/logs/refs/heads/   — branch-level logs"
echo ""
echo "  You can view Git's log with: git log --oneline"
echo "  This transparency is a core value of open-source software."
echo ""
echo "============================================================"
echo "  End of Log File Analyzer"
echo "============================================================"
