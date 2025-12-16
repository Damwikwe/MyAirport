
console.log("MyAirport app.js loaded ✅ v2 AUTLOAD ON");
async function loadBoard() {
  const terminal = document.getElementById("terminal").value;
  const board = document.getElementById("board").value;

  const res = await fetch(`/api/board?terminal=${encodeURIComponent(terminal)}&board=${encodeURIComponent(board)}`);
  const data = await res.json();

  document.getElementById("output").textContent = data.content ?? "";
}

async function addFlight() {
  const terminal = document.getElementById("terminal").value;
  const board = document.getElementById("board").value;
  const flight = document.getElementById("flight").value.trim();

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

  document.getElementById("flight").value = "";
  await loadBoard();
}

document.getElementById("load").addEventListener("click", loadBoard);
document.getElementById("add").addEventListener("click", addFlight);

// Auto-load on page open
loadBoard().catch(e => console.error("loadBoard failed:", e));