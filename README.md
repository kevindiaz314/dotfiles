# Dotfiles

My personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

![Desktop](desktop.png)

## Overview

These dotfiles are configured for [CachyOS](https://cachyos.org/) running [niri](https://yalter.github.io/niri/) as the window manager with [Noctalia shell](https://docs.noctalia.dev/).

## Prerequisites

- CachyOS with KDE Plasma installed
- `chezmoi` and `ghostty` must be installed before applying dotfiles

## Installation

1. Install chezmoi and ghostty:

```fish
paru -S chezmoi ghostty
```

2. Initialize and apply dotfiles:

```fish
chezmoi init --apply kevindiaz314
```

## What's Included

### Window Manager

| Tool | Description |
|------|-------------|
| [niri](https://yalter.github.io/niri/) | Scrollable-tiling Wayland compositor |
| [Noctalia shell](https://docs.noctalia.dev/) | Shell/panel for niri |

### Terminal and Shell

| Tool | Description |
|------|-------------|
| [ghostty](https://ghostty.org/) | GPU-accelerated terminal emulator |
| [Warp](https://warp.dev/) | The terminal with Agents built in |
| [fish](https://fishshell.com/) | User-friendly shell |
| [atuin](https://atuin.sh/) | Shell history with sync |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter cd command |
| [oh-my-posh](https://ohmyposh.dev/) | Prompt theme engine |

### Development

| Tool | Description |
|------|-------------|
| [LazyVim](https://www.lazyvim.org/) | Neovim config for the lazy |
| [lazygit](https://github.com/jesseduffield/lazygit) | Terminal UI for git |
| [Cursor](https://www.cursor.com/) | The AI-powered code editor |
| [opencode](https://opencode.ai/) | The AI coding agent built for the terminal |

### File Management and Utilities

| Tool | Description |
|------|-------------|
| [yazi](https://yazi-rs.github.io/) | Blazing fast terminal file manager |
| [zellij](https://zellij.dev/) | A terminal workspace with batteries included |
| [fastfetch](https://github.com/fastfetch-cli/fastfetch) | System information tool |

## Declarative Package Management

Packages are managed declaratively via `.chezmoidata/packages.yaml`. When you run `chezmoi apply`, the install scripts automatically install all defined packages using:

- `pacman` for official Arch/CachyOS packages
- `paru` (AUR helper) for AUR packages
- `npm` for global Node.js packages

This approach keeps the system reproducible and makes it easy to track what's installed.
