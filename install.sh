#!/usr/bin/env bash

for script in ./assets/*.sh; do
    # Check if the file is actually executable before trying to run it
    if [ -x "$script" ]; then
        echo "Running $script..."
        "$script"
    fi
done
