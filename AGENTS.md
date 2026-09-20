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

- Restore compact memory with `researchctl.py context root:dot_files --json`
  or the exact package owner. Root/path selection is exact by default; use
  `--recursive` only for an intended subtree. Then read necessary direct evidence.
- Do not create Cards, Worklogs, empty research membership or invented history.
  Record a substantive package result once with an event-only checkpoint at
  that exact owner; include purpose, verified result, accepted reasons, checks
  and limits where known. Configured and registered device identity is required.
- Record once at the most specific owner. Repository-wide agent or
  configuration-infrastructure work belongs at this root; cross-root atomic
  work has one primary owner and lists all affected paths.
- Treat aliases that call `/home/yuhanjin/scripts` as cross-root callers. Update
  them atomically with script path or public-entry changes, and validate the
  files without sourcing or reloading the live Nushell configuration.
- Keep `.research-workflow/index.sqlite3` local and non-authoritative; context
  queries may transparently create or refresh this derived cache.
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
<!-- digest: 53b828bcd3473143cd53c8eb3790393d6fec47f065abe2b14e0e167f32b593b7 -->
## Managed Research Workflow Policy

- `case-confirmation`: "A Case target does not imply a Case edit. For explicit registration or simulation-definition changes, finish files/checks, show the saved preview, actually ask and await the user, then apply the exact plan. A digest is not consent; unchanged accepted definitions add no revision."
- `external-operations`: "Do not run cluster, simulation, MATLAB, network, sync, build, or Git mutations without explicit user authorization."
- `framework-authority`: "Use Research Workflow 0.2.3 and the unversioned researchctl CLI. Preserve journal-only Case authority, original Event fields, historical migrate/tombstone bindings, immutable streams, and fail-closed forks."
- `indexing`: "Treat SQLite and saved plans as device-local derived state. Queries may refresh the disposable index; never synchronize it or use it as authority."
- `multi-device`: "Synchronize and check portable authority before context or any portable write after switching devices, including event-only work. Keep local TOML/device/paths, upgrade devices sequentially, and stop old metadata writers until local acceptance. External sync remains separately authorized."
- `propagation`: "Preview pending policy semantics, exact targets and differences; obtain real user approval of the stable digest, record it through policy approve, then apply. Preserve cumulative device approvals and unmanaged AGENTS bytes; Data/Notes and body patches require exact separate scope."
- `recording`: "Restore bounded Case, Study, Project, or exact root/path memory. Record one substantive result as an event at the most specific owner; retain purpose, result, accepted reasons, validation level and limits in existing summary/evidence. Do not log ordinary Q&A or create empty membership or pending queues."
- `workspace-routing`: "Resolve local access through verified roots and explicit mappings. Logical memory may be queried without a local mapping, but new writes require local registration. Keep Data read-only and Notes access within exact authorized links/sections."

<!-- research-workflow:policy:end -->
