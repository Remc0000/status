# Copilot Gantt Status

A reusable GitHub Copilot instruction that turns `status` into a compact Gantt-style project dashboard. It shows task ordering, parallel work, dependencies, the current position, milestones, and the state of the main agent and every visible subagent.

## Install in a repository

Copy `.github/copilot-instructions.md` into the `.github` directory of your repository:

```powershell
git clone https://github.com/Remc0000/status.git
Copy-Item status\.github\copilot-instructions.md <your-repository>\.github\copilot-instructions.md
```

If your repository already has a Copilot instruction file, copy the **Copilot Status Dashboard** section into the existing file instead of replacing it.

## Use

During a GitHub Copilot CLI task, enter:

```text
status
```

Copilot will render the active work as a relative-time Gantt chart. The chart is based on observable task and agent states; it does not claim exact completion percentages when those are unavailable.
