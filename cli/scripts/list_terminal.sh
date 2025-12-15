#!/bin/bash

# Show arrivals and departures for a given terminal (from data/)
# Usage:
#   ./cli/scripts/list_terminal.sh Terminal1

TERMINAL="$1"

if [ -z "$TERMINAL" ]; then
  echo "Usage: ./cli/scripts/list_terminal.sh Terminal1"
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
DATA="$ROOT/data"

TERMINAL_DIR="$DATA/$TERMINAL"
ARRIVALS_FILE="$TERMINAL_DIR/arrivals.txt"
DEPARTURES_FILE="$TERMINAL_DIR/departures.txt"

if [ ! -d "$TERMINAL_DIR" ]; then
  echo "Error: $TERMINAL does not exist under data/."
  exit 1
fi

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
