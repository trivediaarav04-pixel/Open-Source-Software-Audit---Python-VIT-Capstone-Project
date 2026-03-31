#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: [Aarav Trivedi] | Roll: [24BAI10671]
# Course: Open Source Software

echo "========================================"
echo "   Open Source Manifesto Generator"
echo "========================================"
echo ""

# --- Taking user input ---
echo "Answer the following questions:"
echo ""

read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

# --- Date and output file ---
DATE=$(date '+%d %B %Y')
USER_NAME=$(whoami)
OUTPUT="manifesto_${USER_NAME}.txt"

# --- Writing manifesto to file ---
echo "----------------------------------------" > $OUTPUT
echo "   Open Source Manifesto" >> $OUTPUT
echo "----------------------------------------" >> $OUTPUT
echo "Date: $DATE" >> $OUTPUT
echo "Author: $USER_NAME" >> $OUTPUT
echo "" >> $OUTPUT

echo "I believe in the power of open source and collective innovation." >> $OUTPUT
echo "Every day, I rely on tools like $TOOL, which represent collaboration and shared knowledge." >> $OUTPUT
echo "To me, freedom means $FREEDOM — the ability to learn, modify, and improve without restriction." >> $OUTPUT
echo "In the future, I aspire to build $BUILD and share it freely with the world," >> $OUTPUT
echo "so that others can learn, adapt, and grow from it just as I have." >> $OUTPUT
echo "" >> $OUTPUT
echo "I stand for openness, transparency, and community-driven development." >> $OUTPUT

# --- Display result ---
echo ""
echo "Manifesto saved to $OUTPUT"
echo ""
echo "----- Your Manifesto -----"
cat $OUTPUT
