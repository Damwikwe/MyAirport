import express from "express";
import fs from "fs/promises";
import path from "path";
import { fileURLToPath } from "url";


const app = express();
app.use(express.json());

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const ROOT = path.resolve(__dirname, "..");
const DATA = path.join(ROOT, "data");


const validTerminals = new Set(["Terminal1", "Terminal2", "Terminal3"]);
const validBoards = new Set(["arrivals", "departures"]);

function boardPath(terminal, board) {
  if (!validTerminals.has(terminal)) throw new Error("Invalid terminal");
  if (!validBoards.has(board)) throw new Error("Invalid board");
  return path.join(DATA, terminal, `${board}.txt`);
}

app.use(express.static(path.join(__dirname, "public")));

app.get("/api/board", async (req, res) => {
  try {
    const terminal = req.query.terminal;
    const board = req.query.board;
    const p = boardPath(terminal, board);
    const content = await fs.readFile(p, "utf8").catch(() => "");
    res.json({ terminal, board, content });
  } catch (e) {
    res.status(400).json({ error: e.message });
  }
});

app.post("/api/board", async (req, res) => {
  try {
    const { terminal, board, flight } = req.body || {};
    const p = boardPath(terminal, board);
    await fs.mkdir(path.dirname(p), { recursive: true });
    await fs.appendFile(p, `${flight}\n`, "utf8");
    res.json({ ok: true });
  } catch (e) {
    res.status(400).json({ error: e.message });
  }
});

app.delete("/api/board", async (req, res) => {
  try {
    const { terminal, board, flight } = req.body || {};
    const p = boardPath(terminal, board);

    const content = await fs.readFile(p, "utf8").catch(() => "");
    const lines = content.split("\n").filter(Boolean);

    const updated = lines.filter(line => line !== flight);

    await fs.writeFile(p, updated.join("\n") + (updated.length ? "\n" : ""), "utf8");
    res.json({ ok: true });
  } catch (e) {
    res.status(400).json({ error: e.message });
  }
});

const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`MyAirport Web UI running on http://localhost:${port}`));