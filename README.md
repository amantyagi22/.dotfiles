# ⚙️ Aman’s Dotfiles

Portable, symlink-based dotfiles for a modern **macOS** terminal dev environment — just clone, install, and go.

---

## 📦 What's Included

| Tool | Config | Purpose |
| ---- | ------ | ------- |
| **Zsh** | `.zshrc` | Oh My Zsh shell with `git` plugin, custom aliases & PATH |
| **Tmux** | `.tmux.conf` | Terminal multiplexer — `C-a` prefix, vim nav, 8-switchable themes |
| **Neovim** | `.config/nvim/` | LazyVim distro + Copilot, Harpoon, Telescope, Prettier, ESLint, Go/TS |
| **Alacritty** | `.config/alacritty/` | GPU-accelerated terminal — MesloLGS Nerd Font, 6 themes |
| **Ghostty** | `.config/ghostty/` | GPU-accelerated terminal (alt.) — FiraCode Nerd Font, 80% opacity |
| **AeroSpace** | `.aerospace.toml` | i3-style tiling WM for macOS — 10 workspaces, resize/service modes, gaps |
| **SketchyBar** | `.config/sketchybar/` | Custom macOS status bar — AeroSpace workspaces, battery, wifi, volume, memory, clock |
| **tmux-sessionizer** | `.local/bin/` | Fuzzy-find projects, create/attach tmux sessions with dev commands |
| **theme** | `.local/bin/` | One-command theme switcher — updates tmux + Ghostty + Neovim |

---

## 🚀 Quick Start

### 1️⃣ Install Prerequisites

```bash
brew install zsh neovim tmux alacritty git fzf
```

### 2️⃣ Clone & Install

```bash
git clone https://github.com/your-username/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
bash install.sh
```

> The installer **backs up** any existing dotfiles to `~/.dotfiles_backup_<timestamp>`, then creates symlinks — nothing is overwritten.

### 3️⃣ (Optional) Install extras

```bash
# Oh My Zsh (if not already installed)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# AeroSpace tiling WM
brew install nikitabobko/tap/aerospace

# SketchyBar status bar (+ JankyBorders for window borders)
brew install FelixKratz/formulae/sketchybar FelixKratz/formulae/borders

# Ghostty terminal
brew install --cask ghostty

# Nerd Fonts (for Alacritty/Ghostty)
brew install --cask font-meslo-lg-nerd-font font-fira-code-nerd-font

# Neovim tooling helpers (recommended)
brew install ripgrep fd node go
```

---

## 🎨 Theme System

Switch everything at once with the unified theme script:

```bash
theme rose-pine       # 🎯 tmux + Ghostty + Neovim in one command
theme gruvbox-material
theme tokyo-night
```

**Available themes (8):** `rose-pine`, `gruvbox-material`, `catppuccin`, `tokyo-night`, `dracula`, `kanagawa`, `nord`, `night-owl`

---

## 🧩 Dependencies by Feature

| Feature | Required packages |
| ------- | ----------------- |
| Core shell | `zsh`, `git` |
| Terminal (Alacritty) | `alacritty`, `font-meslo-lg-nerd-font` |
| Terminal (Ghostty) | `ghostty`, `font-fira-code-nerd-font` |
| Tmux | `tmux` |
| Tmux sessionizer | `tmux`, `fzf` |
| Neovim (base) | `neovim` |
| Neovim extras | `ripgrep`, `fd`, `node`, `go` |
| AeroSpace | `aerospace` |
| SketchyBar | `sketchybar`, `borders` |

---

## 🔧 Custom Scripts

| Script | What it does |
| ------ | ------------ |
| `~/.local/bin/theme` | Switches tmux status bar + Ghostty colors + Neovim colorscheme simultaneously |
| `~/.local/bin/tmux-sessionizer` | `fzf`-powered project switcher — fuzzy-find dirs, create/attach tmux sessions, launch dev commands (`npm run dev`, `mongosh`, `lazygit`, etc.) |

Make sure `~/.local/bin` is on your `PATH` (add this to `~/.zshrc` if missing):

```bash
export PATH="$HOME/.local/bin:$PATH"
```

---

## 📁 Structure

```
~/.dotfiles
├── .aerospace.toml                     # AeroSpace tiling WM config
├── .tmux.conf                          # Tmux config (prefix: C-a)
├── .zshrc                              # Zsh config (symlinked to ~/.zshrc)
├── install.sh                          # Symlink-based installer
│
├── .config/
│   ├── alacritty/
│   │   ├── alacritty.toml              # Terminal config
│   │   └── themes/                     # 6 color themes
│   ├── ghostty/
│   │   └── config                      # Alt terminal config
│   ├── nvim/
│   │   ├── init.lua                    # LazyVim entry point
│   │   ├── lazyvim.json                # Extras: Copilot, Harpoon, Telescope, Go, TS
│   │   └── lua/
│   │       ├── config/                 # lazy.lua, options.lua, keymaps.lua
│   │       └── plugins/                # colorscheme.lua, copilot.lua
│   ├── tmux/
│   │   ├── current-theme.conf          # Active theme (symlink target)
│   │   └── themes/                     # 8 tmux status bar themes
│   ├── tmux-sessionizer/
│   │   └── tmux-sessionizer.conf       # Search paths & session commands
│   ├── sketchybar/
│   │   ├── sketchybarrc                # Status bar entry point
│   │   ├── toggle-theme.sh             # Light/dark bar toggle
│   │   └── plugins/                    # aerospace, battery, wifi, volume, memory, clock
│   └── zsh/
│       ├── .zshrc                      # Alt zshrc (for ZDOTDIR setups)
│       └── ohmyzsh/                    # Vendored Oh My Zsh
│
└── .local/bin/
    ├── theme                           # Cross-app theme switcher
    └── tmux-sessionizer                # Tmux project fuzzy-finder
```

---

## ⌨️ Key Bindings

### Tmux (`C-a` prefix)

| Binding | Action |
| ------- | ------ |
| `C-a` `\|` | Split horizontal |
| `C-a` `-` | Split vertical |
| `C-a` `h/j/k/l` | Pane navigation |
| `C-a` `r` | Reload config |
| `C-a` `m` | Toggle pane zoom |
| `C-a` `X` | Kill session |

### AeroSpace (`alt` modifier)

| Binding | Action |
| ------- | ------ |
| `alt-⏎` | Open terminal (Ghostty) |
| `alt-j/k/l/;` | Focus left/down/up/right (wraps) |
| `alt-⇧-j/k/l/;` | Move window |
| `alt-o` / `alt-⇧-o` | Focus next/prev window |
| `alt-f` | Fullscreen |
| `alt-s` / `alt-w` | Stacked / tabbed layout |
| `alt-e` | Toggle tile direction |
| `alt-⇧-space` | Toggle floating |
| `alt-1..0` | Switch workspace |
| `alt-⇧-1..0` | Move window to workspace |
| `alt-tab` | Last workspace |
| `alt-⇧-t` | Toggle SketchyBar |
| `alt-⇧-c` | Reload config |
| `alt-r` | Resize mode (h/j/k/l, ⏎/esc to exit) |
| `alt-⇧-s` | Service mode (join-with, reset, close-others) |
