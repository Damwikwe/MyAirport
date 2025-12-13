#!/bin/bash

# Simple script to add a flight to a terminal arrivals or departures file
# Usage:
#   ./scripts/add_flight.sh Terminal1 arrivals "KQ300 Nairobi → London ETA 18:20"

TERMINAL="$1"   # e.g. Terminal1
BOARD="$2"      # "arrivals" or "departures"

# Shift off the first two arguments so $* contains only the flight details
shift 2
FLIGHT_DETAILS="$*"

if [ -z "$TERMINAL" ] || [ -z "$BOARD" ] || [ -z "$FLIGHT_DETAILS" ]; then
  echo "Usage: ./scripts/add_flight.sh Terminal1 arrivals \"KQ300 Nairobi → London ETA 18:20\""
  exit 1
fi

# Make sure the terminal directory exists (safety)
mkdir -p "$TERMINAL"

# Make sure the target file exists
touch "$TERMINAL/${BOARD}.txt"

# Append the flight details
echo "$FLIGHT_DETAILS" >> "$TERMINAL/${BOARD}.txt"

echo "Added to $TERMINAL/${BOARD}.txt: $FLIGHT_DETAILS"
#!/bin/bash

# Simple script to add a flight to a terminal arrivals or departures file
# Usage:
#   ./scripts/add_flight.sh Terminal1 arrivals "KQ300 Nairobi → London ETA 18:20"

TERMINAL=$1       # e.g. Terminal1
BOARD=$2          # "arrivals" or "departures"
shift 2           # shift off the first two args (terminal and board)
FLIGHT_DETAILS="$*"  # everything else becomes the flight details

if [ -z "$TERMINAL" ] || [ -z "$BOARD" ] || [ -z "$FLIGHT_DETAILS" ]; then
  echo "Usage: ./scripts/add_flight.sh Terminal1 arrivals \"KQ300 Nairobi → London ETA 18:20\""
  exit 1
fi

# Make sure the terminal directory exists (it should, but just in case)
mkdir -p "$TERMINAL"

# Make sure the target file exists
touch "$TERMINAL/${BOARD}.txt"

# Append the flight details
echo "$FLIGHT_DETAILS" >> "$TERMINAL/${BOARD}.txt"

echo "Added to $TERMINAL/${BOARD}.txt: $FLIGHT_DETAILS"#!/bin/bash

# Simple script to add a flight to a terminal arrivals or departures file
# Usage: ./add_flight.sh Terminal1 arrivals "KQ300 Nairobi → London ETA 18:20"

TERMINAL=$1       # e.g. Terminal1
BOARD=$2          # arrivals or departures
FLIGHT_DETAILS="${@:3}"  # everything from the 3rd argument onwards

if [ -z "$TERMINAL" ] || [ -z "$BOARD" ] || [ -z "$FLIGHT_DETAILS" ]; then
  echo "Usage: ./add_flight.sh Terminal1 arrivals \"KQ300 Nairobi → London ETA 18:20\""
  exit 1
fi

# Ensure the target file exists
touch "$TERMINAL/${BOARD}.txt"

# Append the flight details
echo "$FLIGHT_DETAILS" >> "$TERMINAL/${BOARD}.txt"
echo "Added to $TERMINAL/$BOARD.txt: $FLIGHT_DETAILS"#!/bin/bash

# Simple script to add a flight to a terminal arrivals or departures file

TERMINAL=$1       # e.g. Terminal1
BOARD=$2          # arrivals or departures
FLIGHT_DETAILS=$3 # e.g. "KQ300 Nairobi → London ETA 18:20"

if [ -z "$TERMINAL" ] || [ -z "$BOARD" ] || [ -z "$FLIGHT_DETAILS" ]; then
  echo "Usage: ./add_flight.sh Terminal1 arrivals \"KQ300 Nairobi → London ETA 18:20\""
  exit 1
fi

echo "$FLIGHT_DETAILS" >> "/$TERMINAL/${BOARD}.txt"
echo "Added to $TERMINAL/$BOARD.txt: $FLIGHT_DETAILS"

