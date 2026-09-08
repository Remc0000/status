# Agent Installation Instructions

This repository provides a Gantt-style status dashboard for GitHub Copilot CLI. When a user asks you to install it in another repository, perform the installation rather than only describing it.

## Source files

- `.github/copilot-instructions.md` defines the `status` response format.
- `.github/extensions/status/extension.mjs` registers the `/status` slash command.

## Install into a target repository

1. Resolve the target repository root and read its existing instruction files before editing.
2. Create `.github` and `.github/extensions/status` in the target repository when needed.
3. If `.github/copilot-instructions.md` does not exist, copy this repository's file there.
4. If that file already exists, preserve it and append only the `# Copilot Status Dashboard` section from this repository. Do not replace unrelated instructions.
5. Copy `.github/extensions/status/extension.mjs` to the same path in the target repository.
6. Do not add npm dependencies. Copilot CLI provides `@github/copilot-sdk` to extensions.
7. Check the extension with `node --check .github/extensions/status/extension.mjs`.
8. Tell the user to open or restart Copilot CLI from the target repository, trust the repository extension when prompted, and run `/status`.

## Repository URL installation request

If a user points you to `https://github.com/Remc0000/status` and asks to install it, fetch or clone this repository, follow the steps above, and validate that both source files exist in the target repository.

Do not overwrite existing user instructions, do not install globally unless explicitly requested, and do not modify files outside the target repository.

## Install globally

When the user explicitly requests global installation:

1. Explain that the installer writes to the user's `~/.copilot` directory and obtain any required path permission.
2. Run `.\install-global.ps1` from this repository.
3. Validate `~/.copilot/extensions/status/extension.mjs` with `node --check`.
4. Reload extensions when the current environment supports hot reload; otherwise tell the user to restart Copilot CLI.
5. Confirm that the global instruction file still contains any pre-existing instructions.

Global installation makes `/status` and the plain `status` instruction available when Copilot CLI is started from any repository.
