#!/bin/bash

# Add a flight to a terminal arrivals or departures file (stored under data/)
# Usage:
#   ./cli/scripts/add_flight.sh Terminal1 arrivals "KQ300 Nairobi → London ETA 18:20"

TERMINAL="$1"   # e.g. Terminal1
BOARD="$2"      # arrivals or departures
shift 2
FLIGHT_DETAILS="$*"

if [ -z "$TERMINAL" ] || [ -z "$BOARD" ] || [ -z "$FLIGHT_DETAILS" ]; then
  echo "Usage: ./cli/scripts/add_flight.sh Terminal1 arrivals \"KQ300 Nairobi → London ETA 18:20\""
  exit 1
fi

# Resolve repo root relative to this script's location
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
DATA="$ROOT/data"

# Ensure terminal folder exists under data/
mkdir -p "$DATA/$TERMINAL"

# Ensure board file exists
touch "$DATA/$TERMINAL/${BOARD}.txt"

# Append flight
echo "$FLIGHT_DETAILS" >> "$DATA/$TERMINAL/${BOARD}.txt"

echo "Added to $TERMINAL/${BOARD}.txt: $FLIGHT_DETAILS"
