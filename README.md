# Copilot Gantt Status

A reusable GitHub Copilot instruction and CLI extension that turn both `status` and `/status` into a compact Gantt-style project dashboard. It shows task ordering, parallel work, dependencies, the current position, milestones, and the state of the main agent and every visible subagent.

## Ask an agent to install it

Point a coding agent at this repository and say:

```text
Install https://github.com/Remc0000/status in this repository.
Follow its AGENTS.md instructions, preserve my existing Copilot instructions,
and enable both status and /status.
```

The repository-level [`AGENTS.md`](AGENTS.md) contains the complete safe installation procedure.

## Install manually

Clone this repository and copy both the instruction and extension directories:

```powershell
git clone https://github.com/Remc0000/status.git
Copy-Item status\.github\copilot-instructions.md <your-repository>\.github\copilot-instructions.md
Copy-Item status\.github\extensions\status <your-repository>\.github\extensions\status -Recurse
```

If your repository already has a Copilot instruction file, copy the **Copilot Status Dashboard** section into the existing file instead of replacing it.

## Install globally

To make `/status` available from every repository for the current user:

```powershell
git clone https://github.com/Remc0000/status.git
Set-Location status
.\install-global.ps1
```

The installer copies the extension to `~/.copilot/extensions/status` and safely adds the dashboard rules to `~/.copilot/copilot-instructions.md`. Existing global instructions are preserved. Restart Copilot CLI after installation.

## Use

Open or restart GitHub Copilot CLI from the target repository and trust the repository extension when prompted. Then enter either:

```text
status
/status
```

Copilot will render the active work as a relative-time Gantt chart. The chart is based on observable task and agent states; it does not claim exact completion percentages when those are unavailable.

## Example output

| ID | Workstream / Owner | Depends | 1 | 2 | 3 | 4 | 5 | 6 | State |
|---|---|---|:---:|:---:|:---:|:---:|:---:|:---:|---|
|  | **NOW** |  |  |  |  | **│** |  |  |  |
| A | Inspect repository / Main | — | `██` |  |  |  |  |  | Complete |
| B | Implement feature / Main | A |  | `██` | `██` |  |  |  | Complete |
| C | Run independent review / Agent 1 | A |  | `██` | `██` |  |  |  | Complete |
| D | Resolve findings / Main | B, C |  |  |  | `▓▓` | `░░` |  | In progress |
| E | Publish release / Main | D |  |  |  |  | `░░` |  | Queued |
| M1 | Release available | E |  |  |  |  |  | `◆` | Queued |

`██` completed · `▓▓` active · `░░` scheduled · `◆` milestone · `│` current timebox

More examples are available in [`examples/status-example.md`](examples/status-example.md).

## How `/status` works

The project-scoped extension at `.github/extensions/status/extension.mjs` registers the slash command. It uses the Copilot CLI extension SDK supplied by the CLI, so no npm install or additional runtime dependency is required.
