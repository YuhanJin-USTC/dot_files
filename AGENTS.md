# dot_files Agent Instructions

## Scope

Keep shared Stow rules at this root. Add a package AGENTS.md only for approved durable local differences.

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
- Keep Neovim Treesitter on the explicit `main` branch and reconcile installed
  plugins with `lazy-lock.json` before changing configuration for API errors.
- Configure and enable language servers with `vim.lsp.config` and
  `vim.lsp.enable`; do not use the removed Mason LSP v1 handler API.

## Managed Neovim

- Prepare a complete configuration copy inside each isolated candidate; do not
  validate a partially applied per-file Stow transition. Keep explicit shared
  `plugin_specs` as the only plugin inventory, without directory-wide imports.
- Managed startup must not bootstrap Lazy, install missing plugins/parsers,
  refresh Mason registries, or download packages/rocks. Candidate preparation
  and explicit activation are separate; retain old and failed generations.
- Keep blink as the selected completion backend. Legacy cmp source/cache may
  remain as user content but must not load through the active plugin inventory.
- Markdown renders in normal mode and exposes source in insert mode; retain
  `<leader>tm`. The limited Unicode math path uses `latex2text` from the system
  `python-pylatexenc` dependency. Do not introduce TeX, uv or pipx installation.
- Preserve all original parser languages plus latex (23 total), grammar revisions
  and native/site hashes. Rebuild for ABI changes only inside candidates; retain
  old artifacts and check actual highlight captures and syntax fallbacks.
- Jukit uses `/usr/bin/python3` and `/usr/bin/ipython3` with Arch `python-pynvim`,
  `ipython`, `python-matplotlib`, `python-pylatexenc`; no `~/base` replacement env.
  Require real provider, cell edit/run, saved-output and conversion checks.
- Keep clangd/pylsp/clang-format/stylua in the original Mason root. Reconstruction
  uses fixed recorded sources/versions through the sole public `nvim_state.py`
  interface and internal `mason_tools.py`, with separate network/build approval.
  Do not silently select latest or expand into browser/HTML/PDF/image features.

## Safety

- Do not delete, prune, clean, move, or overwrite user content without approval
  for the exact path and purpose.
- Do not expose secrets, tokens, private hosts, keys, passwords, or sync
  credentials. Read sensitive values only when necessary and keep them out of
  commands, logs, and responses.
- Git, Stow, isolated Git/Stow fixtures, live reloads, remote operations and system changes require current-task authorization. Inspect SSH, rclone, proxy, cluster and sync callers statically first.

## Research Workflow

- Use `python3 -B /home/yuhanjin/Research_Workflow/tools/researchctl.py context root:dot_files --view compact --json` or the exact package owner. Record one substantive result. For cross-root work list the affected paths at one owner.
- Check aliases in nushell/.config/nushell/config.nu against their scripts entry points. Coordinate changes atomically when both roots are in scope. Validate without sourcing live configuration. Topiary tests use test/temp.nu and --update may rewrite expected output. Verify ownership and authorization before using either.

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

Validate Neovim with the real executable and plugin modules in temporary XDG
directories. Disable installation and network side effects in test copies;
do not replace plugin APIs with mocks when checking compatibility.
Check both Treesitter captures and Vim syntax fallback, including Git and SSH
configuration files; a running parser alone does not prove highlighting works.
<!-- research-workflow:policy:start -->
<!-- digest: 255425630765de0b777c8b315a1469fc936fca419187535850dcd16888fc5f5d -->
## Managed Research Workflow Policy

- `case-confirmation`: "Case ownership alone changes no definition. For registration, definition or lifecycle changes, finish files/checks, show the saved plan, ask and await consent, then apply its digest. Equal definitions add no revision."
- `external-operations`: "Require explicit task authorization for Git, network/API, SSH, cluster, transfer, sync, simulation, MATLAB, builds, containers and SIF operations."
- `framework-authority`: "Use Research Workflow 0.2.4 and its unversioned CLI. Preserve journal-only Cases, original Event fields, migrate/tombstone bindings and immutable streams. Stop on forks."
- `indexing`: "SQLite and saved plans are disposable device-local state. Queries may refresh SQLite. Never sync either or use it as authority."
- `multi-device`: "After a switch, preserve local work and separately authorize sync. Check portable authority with doctor, event merge and validate before context or any portable write. Keep TOML, paths and identity local. Upgrade sequentially with old writers stopped through acceptance."
- `propagation`: "Show pending semantics, exact targets, diffs and stable digest. After user approval, record it with policy approve and apply that digest. Preserve cumulative approvals and unmanaged bytes. Data, Notes and body patches need separate exact scope."
- `recording`: "Restore compact Case, Study, Project or exact root/path context. Record one substantive result at its closest eligible owner, with purpose, result, accepted reasons, checks and limits in summary/evidence. Skip ordinary discussion, empty membership and pending queues."
- `workspace-routing`: "Use verified roots and explicit mappings. Unmapped logical memory is readable. Local access and new writes need registration. Data stays read-only. Scope Notes to exact links/sections and writes to explicit requests."

<!-- research-workflow:policy:end -->
