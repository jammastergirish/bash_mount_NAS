#!/bin/bash

NAS_HOST="XXX"
NAS_USER="XXX"
NAS_PASSWORD="XXX"

VOLUMES=("GIRISH-EXT-1" "GIRISH-EXT-2")

if ! ping -c 1 "$NAS_HOST" &>/dev/null; then
    echo "Ping to $NAS_HOST failed."
    exit 1
fi

mount_volume() {
    local volume="$1"
    if ! mount | grep -q "/Volumes/$volume"; then
        echo "Mounting $volume..."
        osascript <<EOD
            tell application "Finder"
                try
                    mount volume "smb://${NAS_USER}:${NAS_PASSWORD}@${NAS_HOST}/${volume}"
                on error errMsg number errNum
                    do shell script "echo Failed to mount $volume: ${errMsg} (Error number: ${errNum})"
                end try
            end tell
EOD
    else
        echo "$volume already mounted."
    fi
}

for volume in "${VOLUMES[@]}"; do
    mount_volume "$volume"
done

echo "Mounting completed."
