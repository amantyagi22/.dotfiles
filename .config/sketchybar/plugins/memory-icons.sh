#!/bin/bash
PAGE=$(pagesize)
VM=$(vm_stat)

WIRED=$(echo "$VM"  | awk '/Pages wired down/            {gsub(/\./,"",$4); print $4}')
ACTIVE=$(echo "$VM" | awk '/Pages active/                {gsub(/\./,"",$3); print $3}')
COMP=$(echo "$VM"   | awk '/Pages occupied by compressor/{gsub(/\./,"",$5); print $5}')

USED_BYTES=$(( (WIRED + ACTIVE + COMP) * PAGE ))
USED_GB=$(echo "scale=1; $USED_BYTES / 1073741824" | bc)

sketchybar --set "$NAME" icon="󰍛" icon.color=0xffbb9af7 label="${USED_GB}G"
