#!/usr/bin/env bash

# 1. Check if an argument was provided
if [ -z "$1" ]; then
    echo "Error: No color provided."
    echo "Usage: $0 #HEXCOLOR (e.g., $0 #ff5555)"
    exit 1
fi

NEW_COLOR="$1"

# 2. Validate that the input looks like a hex color (#333 or #666666)
if [[ ! "$NEW_COLOR" =~ ^#[0-9a-fA-F]{3}$ && ! "$NEW_COLOR" =~ ^#[0-9a-fA-F]{6}$ ]]; then
    echo "Error: '$NEW_COLOR' is not a valid hex color."
    echo "Please use the format #FFF or #FFFFFF (include the # quotes if needed)."
    exit 1
fi

# Define directories
SRC_DIR="/usr/share/wlogout/assets"
DEST_DIR="$HOME/.config/wlogout/icons"

mkdir -p "$DEST_DIR"

echo "Processing SVGs with color: $NEW_COLOR..."

# Loop and replace colors
for file in "$SRC_DIR"/*.svg; do
    filename=$(basename "$file")
    
    # Replace existing fills, or inject a default fill into the <svg> tag
    sed -E "s/fill=\"#[0-9a-fA-F]{3,6}\"/fill=\"$NEW_COLOR\"/g" "$file" | \
    sed -E "s/<svg([^>]*)>/<svg\1 fill=\"$NEW_COLOR\">/g" > "$DEST_DIR/$filename"
done

echo "Success! Icons updated in $DEST_DIR"

