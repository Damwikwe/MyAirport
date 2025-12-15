#!/bin/bash

# Show arrivals and departures for a given terminal
# Usage:
#   ./scripts/list_terminal.sh Terminal1

TERMINAL="$1"

if [ -z "$TERMINAL" ]; then
  echo "Usage: ./scripts/list_terminal.sh Terminal1"
  exit 1
fi

if [ ! -d "$TERMINAL" ]; then
  echo "Error: $TERMINAL does not exist."
  exit 1
fi

ARRIVALS_FILE="$TERMINAL/arrivals.txt"
DEPARTURES_FILE="$TERMINAL/departures.txt"

echo "==============================="
echo "  $TERMINAL - ARRIVALS"
echo "==============================="

if [ -f "$ARRIVALS_FILE" ]; then
  cat "$ARRIVALS_FILE"
else
  echo "No arrivals recorded."
fi

echo
echo "==============================="
echo "  $TERMINAL - DEPARTURES"
echo "==============================="

if [ -f "$DEPARTURES_FILE" ]; then
  cat "$DEPARTURES_FILE"
else
  echo "No departures recorded."
fi

