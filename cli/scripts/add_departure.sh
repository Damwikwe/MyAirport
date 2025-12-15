#!/bin/bash

# Convenience wrapper around add_flight.sh for departures
# Usage:
#   ./scripts/add_departure.sh Terminal2 "BA150 London → Dubai ETD 12:45"

TERMINAL="$1"
shift 1
FLIGHT_DETAILS="$*"

if [ -z "$TERMINAL" ] || [ -z "$FLIGHT_DETAILS" ]; then
  echo "Usage: ./scripts/add_departure.sh Terminal2 \"BA150 London → Dubai ETD 12:45\""
  exit 1
fi

./scripts/add_flight.sh "$TERMINAL" departures "$FLIGHT_DETAILS"

