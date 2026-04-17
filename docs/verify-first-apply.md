# First-apply verification prompt

Copy the body below and paste it into a fresh Claude Code session opened in `~/.local/share/chezmoi` (so `CLAUDE.md` auto-loads). It works whether or not anything went wrong — the first step reads the apply log and the rest verifies actual-vs-expected state.

---

I just ran `chezmoi init --apply kevindiaz314 2>&1 | tee ~/first-apply.log` on a freshly wiped CachyOS machine. You have `CLAUDE.md` auto-loaded — use it as the source of truth for architecture and expected behavior.

Do the following, in order, and **do not make any repo changes until I approve**. Read and report first.

## 1. Summarize the apply log

Read `~/first-apply.log` and answer in one paragraph:
- Did the full apply complete, or did a script fail?
- If it failed, which script and what was the error?
- Any warnings worth flagging (e.g., a user service enable warning outside a graphical session — those are usually cosmetic)?

## 2. Run the full verification

For each check below, run the command and report PASS/FAIL with the raw output:

1. `chezmoi doctor`
2. `chezmoi state dump-bucket --bucket=scriptState` — confirm every `run_*` script is recorded as run.
3. `grep -A1 '^\[warpdotdev\]' /etc/pacman.conf` — warp repo stanza present.
4. `sudo pacman-key --list-keys linux-maintainers@warp.dev` — warp key present.
5. `pacman -Qi warp-terminal` — warp package installed.
6. `test -f /etc/keyd/default.conf; and cat /etc/keyd/default.conf` — keyd config matches the content embedded in `run_onchange_after_25-setup-keyd-config.sh.tmpl`.
7. `systemctl is-enabled keyd tailscaled` — system services enabled.
8. `systemctl --user is-enabled ssh-agent ssh-add noctalia` — user services enabled.
9. For any service that isn't `enabled`, run `systemctl status <svc>` and `journalctl -u <svc> --no-pager -n 30` (for user-scope services, use `journalctl --user -u <svc> --no-pager -n 30`).
10. `command -v claude; and claude --version` — Claude Code installed and runnable.
11. Read `.chezmoidata/packages.yaml`, then for every entry in `packages.arch.pacman` and `packages.arch.aur`, run `paru -Qq <pkg>`. List any that return non-zero — those did not install.

## 3. Report

Produce:

- A pass/fail table covering every check above.
- For each failure: one-line root cause, and a proposed fix (either a shell command I run, or a repo edit you'll propose for me to review).
- A **manual post-install TODO** list for things the automation deliberately does not do:
  - Switch login session to niri at the greeter (log out of Gnome and pick niri).
  - `git config --global user.name "Kevin Diaz"` and `user.email ...`.
  - Generate an SSH key and symlink it to `~/.ssh/github_key` — `ssh-add.service` has `ConditionPathExists` on that path and will silently no-op until the file exists.
  - `sudo tailscale up` to authenticate the node.
  - Log in to the Nextcloud client and let it sync.
  - After Nextcloud syncs, install MonoLisa fonts: `mkdir -p ~/.local/share/fonts; and cp ~/Nextcloud/Documents/MonoLisa/*.ttf ~/.local/share/fonts/; and fc-cache -fv`.

Do not edit the repo in this pass. I want to review the report, then we fix together.
