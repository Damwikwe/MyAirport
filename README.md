MyAirport ✈️

MyAirport is a small, end-to-end learning project that simulates how an airport manages arrivals, departures, and operational events across multiple terminals.

It combines:
- **Command-line tools (CLI)** for operational control
- **A Node/Express API** as a shared system boundary
- **A browser-based UI** for visual interaction
- **A filesystem-based data layer** representing live airport state

The goal is not realism, but **systems thinking**: how different interfaces stay aligned around the same underlying data.

---

## What MyAirport Does

## Current Capabilities

MyAirport supports full lifecycle management of flights across terminals:

- **Add** flights (via CLI or Web UI)
- **View** arrivals and departures per terminal
- **Amend** existing flight entries
- **Delete** flights

- Records **arrivals and departures** per terminal
- Logs **operational events** (delays, peak periods, cancellations)
- Allows interaction via:
  - shell scripts (CLI)
  - a web dashboard (HTML/CSS/JavaScript)
- Keeps CLI and Web UI fully in sync

