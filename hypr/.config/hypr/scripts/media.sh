#!/bin/bash

# Fetch the metadata and hide any errors
INFO=$(playerctl metadata --format '󰎇 {{title}}  ⁓  󰠃  {{artist}}' 2>/dev/null)

# If INFO has text, print it. Otherwise, print a truly blank line.
if [[ -n "$INFO" ]]; then
    echo "$INFO"
else
    echo ""
fi
