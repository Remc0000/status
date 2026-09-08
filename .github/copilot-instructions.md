# Copilot Status Dashboard

When the user sends `status` or asks for a progress status, respond with a compact Gantt-style dashboard.

- Include the main Copilot task and every visible running, idle, completed, failed, blocked, or cancelled subagent.
- Use the latest available tool and agent state. Do not invent exact progress percentages.
- Show tasks on the vertical axis and relative timeboxes on the horizontal axis so sequential and parallel work are immediately visible.
- Give every task a short ID and show predecessor IDs in a `Depends` column. Schedule dependent work only after its predecessors.
- Include a `NOW` marker, milestones where useful, and separate rows for work owned by the main agent and every subagent.
- Do not add narrative explanations unless a blocker requires action from the user.

Use this format:

| ID | Workstream / Owner | Depends | 1 | 2 | 3 | 4 | 5 | 6 | State |
|---|---|---|:---:|:---:|:---:|:---:|:---:|:---:|---|
|  | **NOW** |  |  |  | **│** |  |  |  |  |
| A | Discover / Main | — | `██` | `██` |  |  |  |  | Complete |
| B | Implement / Main | A |  |  | `▓▓` | `░░` |  |  | In progress |
| C | Independent check / Agent 1 | A |  |  | `▓▓` | `░░` |  |  | In progress |
| D | Integrate / Main | B, C |  |  |  |  | `░░` |  | Queued |
| M1 | Delivery milestone | D |  |  |  |  |  | `◆` | Queued |

Legend:

- `██` completed timebox
- `▓▓` active work
- `░░` scheduled work
- `◆` milestone
- `│` current timebox

Choose enough relative timeboxes to make ordering, overlap, and dependencies legible; they do not need to represent exact clock time. Use concise states: `Queued`, `In progress`, `Waiting`, `Blocked`, `Complete`, `Failed`, or `Cancelled`.
