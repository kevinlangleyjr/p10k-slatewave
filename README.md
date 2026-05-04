<div align="center">

<img src="https://getslatewave.com/brand/icon.png" alt="" height="64" align="middle">
<picture>
  <source media="(prefers-color-scheme: dark)" srcset="https://getslatewave.com/brand/wordmark-light.png">
  <img alt="Slatewave" src="https://getslatewave.com/brand/wordmark.png" height="64" align="middle">
</picture>

# Slatewave (Powerlevel10k)

A Slatewave theme for [Powerlevel10k](https://github.com/romkatv/powerlevel10k) — slate foundation, teal signature. Part of the [Slatewave family](#slatewave-family) — one palette across editors, terminals, prompts, notes, and more.

> _Slate below, teal above._

</div>

---

## What it styles

Slatewave for Powerlevel10k ships as a single `slatewave.p10k.zsh` config file you source from your `.zshrc` after p10k itself loads. It lays out the prompt to match the [Slatewave for Oh My Posh](https://github.com/kevinlangleyjr/slatewave-omp) theme so the visual rhythm stays the same when you switch shells:

- **Two-line frame** — `╭─` opens the prompt, `╰─❯$` closes it on the next line, both in teal
- **Left segments** — OS icon, SSH context, current directory, git status, virtualenv, java version
- **Right segments** — last command's execution time, battery, CPU load (1-min), RAM, time
- **Powerline glyphs** between segments —  for left,  for right,  /  for sub-separators
- **Transient prompt** — old prompts collapse to a single line on enter, so scrollback stays clean

The palette mirrors `vscode-slatewave` and `slatewave-omp` exactly, so segments shaded the same role share the same hex value across editor, terminal, and prompt.

---

## Requirements

- **Powerlevel10k 1.18.0+** — the theme uses truecolor `#rrggbb` foreground/background syntax that older p10k releases parse as 256-color names.
- **A Nerd Font** in your terminal — the powerline + diamond separators and segment icons (, , ) won't render without one. [MesloLGS NF](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k) (p10k's recommendation) and [Hack Nerd Font Mono](https://www.nerdfonts.com/font-downloads) are both verified to work.

---

## Installation

### Via the Slatewave CLI

```sh
slatewave install powerlevel10k
```

The CLI fetches `slatewave.p10k.zsh` to `~/.config/p10k/slatewave.p10k.zsh` and adds the source line to your `.zshrc` for you. `slatewave uninstall powerlevel10k` reverses both.

### Manual

```sh
mkdir -p ~/.config/p10k
curl -fsSL https://raw.githubusercontent.com/kevinlangleyjr/p10k-slatewave/main/slatewave.p10k.zsh \
  -o ~/.config/p10k/slatewave.p10k.zsh
```

Then add this line to your `~/.zshrc`, **after** the line that sources p10k itself:

```sh
[[ -f ~/.config/p10k/slatewave.p10k.zsh ]] && source ~/.config/p10k/slatewave.p10k.zsh
```

A fresh `.zshrc` ends up looking like:

```sh
# powerlevel10k itself (this line is whatever your install method produces)
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# Slatewave on top — applies last so its assignments win
[[ -f ~/.config/p10k/slatewave.p10k.zsh ]] && source ~/.config/p10k/slatewave.p10k.zsh
```

Restart your shell or `source ~/.zshrc` to see the new prompt.

### From a local clone

```sh
git clone https://github.com/kevinlangleyjr/p10k-slatewave
cp p10k-slatewave/slatewave.p10k.zsh ~/.config/p10k/slatewave.p10k.zsh
```

---

## Palette

Slatewave shares its palette with the companion themes. The colors used in the prompt:

| | Hex | Tailwind | Role |
|---|---|---|---|
| ![#e2e8f0](https://placehold.co/20x20/e2e8f0/e2e8f0.png) | `#e2e8f0` | slate-200 | OS icon / SSH text |
| ![#94a3b8](https://placehold.co/20x20/94a3b8/94a3b8.png) | `#94a3b8` | slate-400 | execution time, CPU/RAM idle |
| ![#334155](https://placehold.co/20x20/334155/334155.png) | `#334155` | slate-700 | git loading background |
| ![#1e293b](https://placehold.co/20x20/1e293b/1e293b.png) | `#1e293b` | slate-800 | deepest background |
| ![#193549](https://placehold.co/20x20/193549/193549.png) | `#193549` | — | contrast text on bright accent backgrounds (git, battery) |
| ![#2c313a](https://placehold.co/20x20/2c313a/2c313a.png) | `#2c313a` | — | secondary surface (path, time) |
| ![#3e4451](https://placehold.co/20x20/3e4451/3e4451.png) | `#3e4451` | — | raised surface (os, ssh, sysinfo) |
| ![#5eead4](https://placehold.co/20x20/5eead4/5eead4.png) | `#5eead4` | teal-300 | **signature** — frame, path text, prompt char, time |
| ![#0e7490](https://placehold.co/20x20/0e7490/0e7490.png) | `#0e7490` | cyan-700 | battery charging / charged |
| ![#ecfeff](https://placehold.co/20x20/ecfeff/ecfeff.png) | `#ecfeff` | cyan-50 | high-contrast text on cyan/amber |
| ![#38bdf8](https://placehold.co/20x20/38bdf8/38bdf8.png) | `#38bdf8` | sky-400 | git clean |
| ![#fbbf24](https://placehold.co/20x20/fbbf24/fbbf24.png) | `#fbbf24` | amber-400 | CPU warning |
| ![#b45309](https://placehold.co/20x20/b45309/b45309.png) | `#b45309` | amber-700 | battery discharging / low |
| ![#fb7185](https://placehold.co/20x20/fb7185/fb7185.png) | `#fb7185` | rose-400 | git modified, CPU critical |
| ![#ef5350](https://placehold.co/20x20/ef5350/ef5350.png) | `#ef5350` | — | prompt char on non-zero exit |

---

## Customize

Every value in `slatewave.p10k.zsh` is a plain `typeset -g POWERLEVEL9K_*` assignment, so override individual entries by setting them again **below** the `source` line in your `.zshrc`:

```sh
source ~/.config/p10k/slatewave.p10k.zsh

# Swap the time format from "3:04 PM" to ISO-ish "15:04"
typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'

# Drop the load segment from the right block
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  command_execution_time
  battery
  ram
  time
)
```

To swap to a different segment set entirely (e.g. add `kubecontext`, `aws`, or `node_version`), copy the file to `~/.config/p10k/slatewave.p10k.local.zsh`, edit `POWERLEVEL9K_LEFT_PROMPT_ELEMENTS` / `POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS`, and source the local copy instead. The Slatewave colors carry over automatically — p10k applies whatever `*_BACKGROUND` and `*_FOREGROUND` are set for each segment, regardless of which segments are in the prompt list.

---

## Slatewave family

One palette. Every tool.

- **Editors** — [VSCode](https://github.com/kevinlangleyjr/vscode-slatewave) · [Neovim](https://github.com/kevinlangleyjr/neovim-slatewave) · [Helix](https://github.com/kevinlangleyjr/helix-slatewave) · [Zed](https://github.com/kevinlangleyjr/zed-slatewave) · [Sublime Text](https://github.com/kevinlangleyjr/sublime-text-slatewave) · [JetBrains](https://github.com/kevinlangleyjr/jetbrains-slatewave)
- **Terminals** — [Alacritty](https://github.com/kevinlangleyjr/alacritty-slatewave) · [Ghostty](https://github.com/kevinlangleyjr/ghostty-slatewave) · [iTerm2](https://github.com/kevinlangleyjr/iterm2-slatewave) · [WezTerm](https://github.com/kevinlangleyjr/wezterm-slatewave) · [Windows Terminal](https://github.com/kevinlangleyjr/windows-terminal-slatewave)
- **Prompts** — [Oh My Posh](https://github.com/kevinlangleyjr/slatewave-omp) · [Starship](https://github.com/kevinlangleyjr/starship-slatewave)
- **Multiplexer** — [tmux](https://github.com/kevinlangleyjr/tmux-slatewave)
- **Notes** — [Obsidian](https://github.com/kevinlangleyjr/obsidian-slatewave) · [Logseq](https://github.com/kevinlangleyjr/logseq-slatewave)
- **Launchers** — [Alfred](https://github.com/kevinlangleyjr/alfred-slatewave) · [Raycast](https://github.com/kevinlangleyjr/raycast-slatewave)
- **Chat** — [Slack](https://github.com/kevinlangleyjr/slack-slatewave)

---

## License

[WTFPL](LICENSE) — do whatever you want with this.
