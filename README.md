# MyAirport ✈️

**MyAirport** is a hybrid **Command Line Interface (CLI) and Web-based airport simulation**, built to explore systems thinking, shell scripting, and full-stack integration.

The project models how an airport organises operational data — terminals, arrivals, departures, and logs — using a shared filesystem, accessed consistently via both shell scripts and a browser interface.

---

## 🧭 Project Overview

At its core, MyAirport is about **coordination**:

- CLI tools and a web dashboard operate on the **same underlying data**
- The filesystem acts as a simple, transparent “database”
- Clear separation exists between:
  - data (state)
  - tooling (CLI)
  - services (web server)
  - interface (browser UI)

This mirrors real-world architectural patterns in a deliberately lightweight way.

---

## 📁 Repository Structure

```text
MyAirport/
├── data/                  # Airport state (runtime data)
│   ├── Terminal1/
│   ├── Terminal2/
│   ├── Terminal3/
│   ├── Airlines/
│   ├── Gates/
│   └── logs/
│
├── cli/                   # Command-line tools
│   └── scripts/
│       ├── add_flight.sh
│       ├── add_departure.sh
│       ├── list_terminal.sh
│       └── log_event.sh
│
├── web/                   # Web application
│   ├── server.js          # Node.js / Express API
│   └── public/
│       ├── index.html     # Browser UI
│       └── app.js
│
├── README.md
├── package.json
├── package-lock.json
└── .gitignore
