# Example Copilot Status

| ID | Workstream / Owner | Depends | 1 | 2 | 3 | 4 | 5 | 6 | State |
|---|---|---|:---:|:---:|:---:|:---:|:---:|:---:|---|
|  | **NOW** |  |  |  |  | **│** |  |  |  |
| A | Inspect repository / Main | — | `██` |  |  |  |  |  | Complete |
| B | Prepare example / Main | A |  | `██` | `██` |  |  |  | Complete |
| C | Review format / Agent 1 | A |  | `██` | `██` |  |  |  | Complete |
| D | Publish update / Main | B, C |  |  |  | `▓▓` | `░░` |  | In progress |
| M1 | Example available | D |  |  |  |  |  | `◆` | Queued |

Legend:

- `██` completed timebox
- `▓▓` active work
- `░░` scheduled work
- `◆` milestone
- `│` current timebox
