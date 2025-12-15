#!/bin/bash

# Log an operational event with a timestamp into logs/operations.log
# Usage:
#   ./scripts/log_event.sh "KQ300 delayed due to weather"

MESSAGE="$*"

if [ -z "$MESSAGE" ]; then
  echo "Usage: ./scripts/log_event.sh \"Some message about an event\""
  exit 1
fi

mkdir -p logs
touch logs/operations.log

echo "$(date '+%Y-%m-%d %H:%M:%S') - $MESSAGE" >> logs/operations.log
echo "Logged: $MESSAGE"

