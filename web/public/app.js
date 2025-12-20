
console.log("MyAirport app.js loaded ✅ v3 DELETE ENABLED");

function getState() {
  const terminal = document.getElementById("terminal").value;
  const board = document.getElementById("board").value;
  return { terminal, board };
}

async function loadBoard() {
  const { terminal, board } = getState();

  const res = await fetch(
    `/api/board?terminal=${encodeURIComponent(terminal)}&board=${encodeURIComponent(board)}`
  );

  if (!res.ok) {
    throw new Error(`Failed to load board (${res.status})`);
  }

  const data = await res.json();
  const output = document.getElementById("output");
  output.innerHTML = "";

  const lines = (data.content || "")
    .split("\n")
    .map(s => s.trimEnd())
    .filter(Boolean);

  if (lines.length === 0) {
    output.textContent = "No flights recorded.";
    return;
  }

  for (const flight of lines) {
    const row = document.createElement("div");
    row.className = "board-row";

    const text = document.createElement("div");
    text.className = "board-flight";
    text.textContent = flight;

    const del = document.createElement("button");
    del.textContent = "Delete";
    del.addEventListener("click", async () => {
      const ok = confirm(`Delete this flight?\n\n${flight}`);
      if (!ok) return;
      await deleteFlight(flight);
    });

    row.appendChild(text);
    row.appendChild(del);
    output.appendChild(row);
  }
}

async function addFlight() {
  const { terminal, board } = getState();
  const flightInput = document.getElementById("flight");
  const flight = flightInput.value.trim();

  if (!flight) return;

  const res = await fetch(`/api/board`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ terminal, board, flight })
  });

  if (!res.ok) {
    const err = await res.json().catch(() => ({}));
    alert(err.error || "Failed to add flight");
    return;
  }

  flightInput.value = "";
  await loadBoard();
}

async function deleteFlight(flight) {
  const { terminal, board } = getState();

  const res = await fetch(`/api/board`, {
    method: "DELETE",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ terminal, board, flight })
  });

  if (!res.ok) {
    const err = await res.json().catch(() => ({}));
    alert(err.error || "Failed to delete flight");
    return;
  }

  await loadBoard();
}

document.getElementById("load").addEventListener("click", () => {
  loadBoard().catch(e => console.error("loadBoard failed:", e));
});

document.getElementById("add").addEventListener("click", () => {
  addFlight().catch(e => console.error("addFlight failed:", e));
});

// Optional: auto-load when dropdowns change (nice UX)
document.getElementById("terminal").addEventListener("change", () => {
  loadBoard().catch(e => console.error("loadBoard failed:", e));
});
document.getElementById("board").addEventListener("change", () => {
  loadBoard().catch(e => console.error("loadBoard failed:", e));
});

// Auto-load on page open
loadBoard().catch(e => console.error("loadBoard failed:", e));
