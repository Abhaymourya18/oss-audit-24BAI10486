#!/bin/bash
# ============================================================
# Script 5: Open Source Manifesto Generator
# Author: Abhay Mourya | Roll No: 24BAI10486
# Course: Open Source Software | Chosen Software: Git
# Description: Interactively asks the user 3 questions and
#              generates a personalised open-source philosophy
#              statement, saved to a .txt file.
# ============================================================

# --- Alias demonstration (aliases simplify repeated commands) ---
# Note: aliases defined in scripts don't persist outside the script.
# This is a demonstration of the concept.
alias today='date "+%d %B %Y"'
alias greet='echo "Welcome to the Open Source Manifesto Generator!"'

echo "============================================================"
greet
echo "============================================================"
echo ""
echo "  This script will generate your personal open-source"
echo "  philosophy statement based on your answers."
echo ""
echo "  Inspired by: Git — the tool that powers open collaboration"
echo "  worldwide, built by Linus Torvalds in 2005."
echo ""
echo "------------------------------------------------------------"
echo "  Please answer the following three questions:"
echo "------------------------------------------------------------"
echo ""

# --- read: Collect user input interactively ---

# Question 1: An open-source tool they use daily
read -p "  1. Name one open-source tool you use every day: " TOOL

# Validate that the user entered something (not blank)
while [ -z "$TOOL" ]; do
    echo "  Please enter a tool name — don't leave it blank!"
    read -p "  1. Name one open-source tool you use every day: " TOOL
done

# Question 2: What freedom means to them
read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM

while [ -z "$FREEDOM" ]; do
    echo "  Please enter a word!"
    read -p "  2. In one word, what does 'freedom' mean to you? " FREEDOM
done

# Question 3: Something they would build and share
read -p "  3. Name one thing you would build and share freely: " BUILD

while [ -z "$BUILD" ]; do
    echo "  Please enter something you'd build!"
    read -p "  3. Name one thing you would build and share freely: " BUILD
done

echo ""
echo "------------------------------------------------------------"
echo "  Generating your manifesto..."
echo "------------------------------------------------------------"
echo ""

# --- Variables for the output file ---
DATE=$(date '+%d %B %Y')                    # Current date
TIME=$(date '+%H:%M:%S')                    # Current time
AUTHOR=$(whoami)                             # Current Linux username
OUTPUT="manifesto_${AUTHOR}.txt"            # Output filename

# --- String concatenation to build the manifesto paragraph ---
# Each line is built as a string and written to the file using >>

# Clear the file first if it already exists (using >)
> "$OUTPUT"

# Write the manifesto to the file using >> (append)
echo "============================================================" >> "$OUTPUT"
echo "       MY OPEN SOURCE MANIFESTO" >> "$OUTPUT"
echo "       Generated on: $DATE at $TIME" >> "$OUTPUT"
echo "       Author: $AUTHOR" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
echo "" >> "$OUTPUT"

# Compose the personalised paragraph using the user's answers
echo "  I believe in the power of open-source software." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  Every day, I rely on $TOOL — a tool that exists" >> "$OUTPUT"
echo "  not because someone wanted to make money, but because" >> "$OUTPUT"
echo "  a community of people chose to build it openly and share" >> "$OUTPUT"
echo "  it freely with the world. That is not a small thing." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  To me, freedom means $FREEDOM. In the world of software," >> "$OUTPUT"
echo "  that freedom is made real through open licenses, public" >> "$OUTPUT"
echo "  source code, and the right to study, modify, and share" >> "$OUTPUT"
echo "  the tools we depend on." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  One day, I want to build $BUILD — and when I do," >> "$OUTPUT"
echo "  I will share it openly, just as others have shared" >> "$OUTPUT"
echo "  their work with me. Because that is how progress happens." >> "$OUTPUT"
echo "  Not in secret. Not behind a paywall. But together." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  Git taught me this. One person — Linus Torvalds — wrote" >> "$OUTPUT"
echo "  the first version in two weeks. Today, millions of" >> "$OUTPUT"
echo "  developers use it every day to collaborate across borders," >> "$OUTPUT"
echo "  time zones, and organizations. That is the open-source" >> "$OUTPUT"
echo "  way: build it, share it, and let the world improve it." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "  I stand on the shoulders of giants — and I will pay it" >> "$OUTPUT"
echo "  forward." >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"
echo "  Signed: $AUTHOR | $DATE" >> "$OUTPUT"
echo "============================================================" >> "$OUTPUT"

# --- Display success message ---
echo "  ✔ Manifesto saved to: $OUTPUT"
echo ""
echo "------------------------------------------------------------"
echo "  YOUR MANIFESTO:"
echo "------------------------------------------------------------"
echo ""

# --- Display the generated manifesto file ---
cat "$OUTPUT"

echo ""
echo "============================================================"
echo "  End of Open Source Manifesto Generator"
echo "============================================================"
