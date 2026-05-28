# AGENTS.md

## Core Purpose

This dotfiles project exists to improve research efficiency.

All changes should support the user's laser-plasma physics research workflow, especially theory, PIC simulation, cluster usage, containerized research software, and fast editing/shell automation. Prefer practical improvements that reduce friction in daily work with tools such as Smilei, EPOCH, WarpX, FaTiDo, Geant4, Apptainer/Singularity, Neovim, Nushell, and HPC clusters.

## Project Shape

This repository uses a Stow-style layout. Keep each package self-contained:

- `nvim/`: Neovim Lua configuration and plugins.
- `nushell/`: shell startup config, aliases, cluster sync helpers, and research workflow commands.
- `topiary/`: Nushell formatting support and tests.
- `git/`, `ssh/`, `aria2/`, `rclone/`: local system and network tool configuration.

Do not move files between packages unless the user asks for a layout change.

## Code Style

Keep style consistent with the surrounding file.

- Prefer small, direct changes over broad rewrites.
- Preserve existing module boundaries and naming patterns.
- Lua config should stay simple and table-driven where possible.
- Nushell scripts should use clear pipelines and existing Topiary formatting.
- Shell snippets should remain POSIX/Bash-clear unless the file already uses another style.
- Avoid adding new frameworks, plugin managers, formatters, or abstraction layers unless they solve a real workflow problem.
- Do not refactor unrelated code while making a requested change.

## Comment Style

Comments must stay minimal and consistent.

- Add comments only when they explain non-obvious workflow, environment, or tool behavior.
- Prefer short English comments.
- Short Chinese comments are acceptable when they match nearby existing comments or clarify a local research workflow.
- Avoid tutorial-style comments in new code.
- Do not add noisy comments that simply restate the code.

## Safety Rules

This repository contains personal system configuration.

- Do not delete, remove, prune, clean up, or overwrite user content without explicit approval.
- If deletion seems necessary, list the exact path, explain why, and wait for approval.
- Do not expose secrets, tokens, private hosts, private keys, passwords, or sync credentials from local config files.
- Do not run `git status`, `git add`, `git commit`, or other git workflow commands unless the user explicitly asks for git work.
- Before changing sensitive config such as SSH, rclone, proxy, cluster, or sync settings, inspect the surrounding workflow carefully.

## Validation

Use the narrowest useful check for the files changed.

- For Lua/Neovim changes, prefer existing Neovim/Lua formatting and check the edited module loads conceptually.
- For Nushell changes, use the existing Topiary/Nushell formatting path when practical.
- For Topiary changes, run the existing formatter tests if the change affects formatting rules.
- For shell/config changes, check syntax or command shape without touching user data.
