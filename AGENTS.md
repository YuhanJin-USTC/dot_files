# dot_files Agent Instructions

## Scope

These instructions apply to `/home/yuhanjin/dot_files`. Explicit user
instructions take priority within the authorized scope. Keep shared rules here;
add no nested `AGENTS.md` unless a package gains a durable local difference.

This personal Stow repository should reduce friction in laser-plasma theory,
PIC simulation, cluster or container use, and daily editing or shell work. Its
tools include Smilei, EPOCH, WarpX, FaTiDo, Geant4,
Apptainer/Singularity, Neovim, Nushell, and HPC systems.

## Layout

Keep every package self-contained:

- `nvim/`: Neovim Lua configuration and plugins.
- `nushell/`: startup configuration, aliases, cluster synchronization helpers,
  and research commands.
- `topiary/`: Nushell formatting support and tests.
- `git/`, `ssh/`, `aria2/`, `rclone/`: system and network-tool configuration.

Do not move files between packages unless the user requests a layout change.

## Change Rules

- Read affected files, callers, and nearby patterns. Trace Stow destinations,
  paths, commands, plugin order, and effective behavior when relevant.
- Make small, direct changes; preserve package boundaries, naming, public
  commands, and unrelated content.
- Match local style. Prefer simple table-driven Lua, clear Nushell pipelines
  with existing Topiary formatting, and POSIX/Bash-clear shell snippets unless
  the file already uses another language.
- Add no framework, plugin manager, formatter, or abstraction layer unless it
  solves the requested workflow problem.
- Keep comments minimal. Explain only non-obvious workflow, environment, or
  tool behavior; prefer short English. Short Chinese comments remain acceptable
  when they match nearby text or clarify a local research workflow. Avoid
  tutorials, narration, and restating code.

## Safety

- Do not delete, prune, clean, move, or overwrite user content without approval
  for the exact path and purpose.
- Do not expose secrets, tokens, private hosts, keys, passwords, or sync
  credentials. Read sensitive values only when necessary and keep them out of
  commands, logs, and responses.
- Do not run Git commands unless the user explicitly requests Git work.
- Inspect SSH, rclone, proxy, cluster, and sync workflows before changing them.
  Do not run Stow, reload live configuration, contact remote systems, or apply
  system changes merely to validate an edit.

## Research Workflow Contract

- For a Case target, run the canonical `researchctl.py context` with
  `--recent 3 --json`. For this non-Case registered root, use these nearest
  instructions and direct file evidence; the context command does not accept
  registered roots themselves.
- Do not create Cards or Worklogs or reconstruct history. At the first
  substantive modification, reusable validation result, or explicit decision
  owned by a package, preview `researchctl.py event record` for that owner,
  inspect the canonical V0 event, and repeat the same identity and times with
  `--write`. A missing device ID must refuse the append.
- Record once at the most specific owner. Repository-wide agent or
  configuration-infrastructure work belongs at this root; cross-root atomic
  work has one primary owner and lists all affected paths.
- Treat aliases that call `/home/yuhanjin/scripts` as cross-root callers. Update
  them atomically with script path or public-entry changes, and validate the
  files without sourcing or reloading the live Nushell configuration.
- Keep `.research-workflow/index.sqlite3` local-only and create or update it
  only by an explicit cache command.
- Do not log pure Q&A, planning, read-only inspection, or failed work with no
  durable result. Use concise English and exclude secrets, raw configuration,
  full conversations, and unsupported conclusions.

## Validation and Completion

Use the narrowest applicable check:

| Artifact | Baseline |
| --- | --- |
| Lua or Neovim | Existing format or syntax check; inspect module loading without changing live state |
| Nushell | Existing Topiary path and `nu --ide-check 100` when available |
| Topiary rules | Existing formatter tests |
| Shell or configuration | Syntax and command-shape review without touching user data |

Do not install missing tools or turn validation into Stow, live reload, remote
access, or user-data writes. Re-read changed files. Finish only when rules and
behavior agree, the required V0 event is recorded once, and the handoff
lists changes, checks, skipped live operations, and every remaining `unknown`
or `to-confirm` item.
<!-- research-workflow:policy:start -->
<!-- digest: 6e0a68425ea80ae3d662ae2adc443bc98e23190e505c8a9c36daac2c4fbbe164 -->
## Managed Research Workflow Policy

- `external-operations`: "Do not run cluster, simulation, MATLAB, network, sync, or Git mutations without explicit user authorization."
- `framework-authority`: "Use only current Research Workflow V0 authorities and the unversioned CLI; obsolete V1/V2/V2.1 assets are not runtime authority."
- `propagation`: "Default to local-first and require explicit scope approval plus a digest-bound policy apply while preserving unmanaged AGENTS text."
- `recording`: "Use device-gated preview/write V0 events, record once at the most specific owner, and keep unsupported scientific status unknown."
- `workspace-routing`: "Resolve registered roots through workspace.toml; keep Data read-only and access Notes only through explicit links or requests."

<!-- research-workflow:policy:end -->
