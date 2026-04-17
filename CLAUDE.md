# Dotfiles automation (CachyOS)

Context for any Claude session opened in this repo. Focused on the package/service/claude-code automation — not a generic project overview. If something broke on a fresh-machine apply, jump to [Troubleshooting](#troubleshooting).

## What this automation does

On `chezmoi apply`, three things happen declaratively on Linux:

1. Adds the Warp pacman repo (`[warpdotdev]`) to `/etc/pacman.conf`, imports + locally signs its key, refreshes the db.
2. Installs all packages in [.chezmoidata/packages.yaml](.chezmoidata/packages.yaml) via `paru -S --needed …` (pacman + AUR in one invocation). `--noconfirm` is intentionally omitted so the user handles version/conflict prompts interactively.
3. Writes `/etc/keyd/default.conf` (content embedded in the script) and restarts `keyd` if it's already running.
4. Enables system + user systemd services from [.chezmoidata/services.yaml](.chezmoidata/services.yaml) with `systemctl enable --now`, guarded by `is-enabled`.

On first apply only, also installs Claude Code via Anthropic's install script (`curl -fsSL https://claude.ai/install.sh | bash`). Subsequent updates are handled by `claude update`, not chezmoi.

## File layout

```
.chezmoidata/
  packages.yaml                                     # pacman + aur lists
  services.yaml                                     # system + user services
run_onchange_before_10-setup-warp-repo.sh.tmpl      # warp repo + key (before installs)
run_onchange_before_20-install-packages.sh.tmpl     # paru one-liner
run_onchange_after_25-setup-keyd-config.sh.tmpl     # /etc/keyd/default.conf + restart
run_onchange_after_30-enable-services.sh.tmpl       # systemctl loops
run_once_after_install-claude-code.sh.tmpl          # one-shot curl|bash install
```

## Key design decisions

- **Fish shebangs** (`#!/usr/bin/env fish`) — CachyOS defaults to fish.
- **Numeric prefixes** (`10-`, `20-`, `30-`) order scripts within the `before_` / `after_` phases (chezmoi sorts alphabetically inside a phase).
- **Warp repo script runs before package install.** `warp-terminal` lives in the pacman list; the `[warpdotdev]` repo must exist first. If the install script fails on `warp-terminal`, suspect the `10-` script — not the package list.
- **keyd config uses numeric `25-` in `after_` phase** — runs after the package install has put `/etc/keyd/` on disk (via the keyd package) but before `30-enable-services` turns the daemon on. Config is embedded in the script, so editing the script is how you change the keybindings.
- **`before_` for repo/package work, `after_` for service enables.** Services need their unit files in [dot_config/systemd/user/](dot_config/systemd/user/) on disk before `systemctl --user enable` can see them.
- **`.chezmoidata/` pacman/aur split is organizational, not functional.** paru handles both. The split just makes audits easier.
- **OS gate on every script** (`{{ if eq .chezmoi.os "linux" -}}`) — renders empty on macOS, chezmoi skips empty scripts.
- **`is-enabled --quiet` guard before enable** — idempotent, tolerates manual enables or partial prior state.
- **`enable --now`** starts services immediately AND at boot. Graphical-session-only user services (noctalia) may warn if enabled outside a graphical session — the warning is cosmetic; `enable` still took effect.
- **`run_once_` for Claude Code, not `run_onchange_`** — the installer is one-shot; Claude Code has its own updater.

## How chezmoi detects "changed"

`run_onchange_` scripts re-run when their **rendered** content changes. The package list is inlined into the rendered script via `{{ range }}` — so editing `.chezmoidata/packages.yaml` changes the script body and chezmoi re-runs it. Same for services. No separate hash comment needed.

To preview what a script will actually run:
```fish
chezmoi execute-template < run_onchange_before_20-install-packages.sh.tmpl
```

## Troubleshooting

### Capturing a first-apply log

On a fresh machine, always pipe the first apply to a file so you can share it:
```fish
chezmoi init --apply git@github.com:<you>/<repo>.git 2>&1 | tee ~/first-apply.log
```
(Or `chezmoi apply -v 2>&1 | tee ~/apply.log` if already initialized.)

Paste the log when asking for help — it shows which script failed and its output.

### General health

```fish
chezmoi doctor                                  # env sanity
chezmoi state dump-bucket --bucket=scriptState  # which run_* scripts chezmoi recorded as run
```

### Warp repo verification

```fish
grep -A1 warpdotdev /etc/pacman.conf                       # repo stanza present?
sudo pacman-key --list-keys linux-maintainers@warp.dev     # key imported?
pacman -Si warp-terminal                                    # can pacman see the package?
```

If the repo stanza is missing, the `10-setup-warp-repo` script didn't run or failed silently. If the key is missing, rerun:
```fish
sudo pacman-key -r linux-maintainers@warp.dev
sudo pacman-key --lsign-key linux-maintainers@warp.dev
sudo pacman -Sy
```

### Package install failures

```fish
pacman -Qi warp-terminal                   # was warp-terminal actually installed?
paru -Qi <failed_pkg>                      # per-package state
paru -S --needed <failed_pkg>              # retry one package interactively to see prompts
```

AUR builds often fail on missing `base-devel` (shouldn't happen on CachyOS) or a broken PKGBUILD upstream. Check `paru` output for the specific build error.

### Service failures

```fish
systemctl is-enabled keyd tailscaled
systemctl --user is-enabled ssh-agent ssh-add noctalia
systemctl status <svc>                     # why isn't svc running?
journalctl -u <svc> --no-pager -n 50       # system service logs
journalctl --user -u <svc> --no-pager -n 50  # user service logs
```

`ssh-add.service` needs `~/.ssh/github_key` (see [dot_config/systemd/user/ssh-add.service.tmpl](dot_config/systemd/user/ssh-add.service.tmpl) `ConditionPathExists`). If the key isn't there yet, the unit exits cleanly with `condition check failed` — not a real failure.

### Claude Code

```fish
command -v claude                          # installed where? expect ~/.local/bin/claude
claude --version
```
If `command -v claude` is empty but the install script ran, check `~/first-apply.log` for the curl|bash output. `~/.local/bin` is on PATH via [dot_config/fish/config.fish.tmpl](dot_config/fish/config.fish.tmpl).

### Re-running a `run_once_` script

chezmoi records run state in `$XDG_DATA_HOME/chezmoi/chezmoistate.boltdb`. To force a re-run:
```fish
chezmoi state delete-bucket --bucket=scriptState
```
(nukes all run_once/onchange state — next apply re-runs everything).

## What to share when asking Claude for help

1. `~/first-apply.log` (or the output of the failed `chezmoi apply -v`).
2. The rendered version of the suspect script: `chezmoi execute-template < <script>.tmpl`.
3. Output of the relevant troubleshooting section above.

With those three, future Claude has intent (this doc), actual (your log), and system state (your command output) — enough to diagnose almost anything.
