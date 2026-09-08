import { joinSession } from "@github/copilot-sdk/extension";

const statusPrompt = [
  "Report the current work as a compact Gantt-style dashboard.",
  "Include the main task and every visible subagent.",
  "Put tasks on the vertical axis and relative timeboxes on the horizontal axis.",
  "Show predecessor IDs in a Depends column, parallel work as overlapping bars,",
  "a NOW marker, useful milestones, and concise task states.",
  "Use ██ for completed work, ▓▓ for active work, ░░ for scheduled work,",
  "◆ for milestones, and │ for the current timebox.",
  "Do not add narrative unless a blocker requires user action.",
].join(" ");

const session = await joinSession({
  commands: [
    {
      name: "status",
      description: "Show current task and agent progress as a Gantt chart",
      handler: async () => {
        await session.send({ prompt: statusPrompt });
      },
    },
  ],
  tools: [],
  hooks: {},
});
