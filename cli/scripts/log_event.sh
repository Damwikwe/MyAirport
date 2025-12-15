#!/bin/bash

# Log an operational event with timestamp into data/logs/operations.log
# Usage:
#   ./cli/scripts/log_event.sh "KQ300 delayed due to weather"

MESSAGE="$*"

if [ -z "$MESSAGE" ]; then
  echo "Usage: ./cli/scripts/log_event.sh \"Some operational event\""
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
DATA="$ROOT/data"

mkdir -p "$DATA/logs"
touch "$DATA/logs/operations.log"

echo "$(date '+%Y-%m-%d %H:%M:%S') - $MESSAGE" >> "$DATA/logs/operations.log"
echo "Logged: $MESSAGE"
