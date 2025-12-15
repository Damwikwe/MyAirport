#!/bin/bash

# Convenience wrapper: add a departure to a terminal
# Usage:
#   ./cli/scripts/add_departure.sh Terminal2 "BA150 London → Dubai ETD 12:45"

TERMINAL="$1"
shift 1
FLIGHT_DETAILS="$*"

if [ -z "$TERMINAL" ] || [ -z "$FLIGHT_DETAILS" ]; then
  echo "Usage: ./cli/scripts/add_departure.sh Terminal2 \"BA150 London → Dubai ETD 12:45\""
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
"$SCRIPT_DIR/add_flight.sh" "$TERMINAL" departures "$FLIGHT_DETAILS"
