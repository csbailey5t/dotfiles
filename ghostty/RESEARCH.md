# Ghostty on macOS - Configuration Research

> Compiled research on best practices, design patterns, and configuration options
> for the Ghostty terminal emulator on macOS.

## Overview

Ghostty is a GPU-accelerated, cross-platform terminal emulator built with native
platform UI. On macOS it uses Swift/AppKit/Metal, making it feel like a true native
app with real windowing, menu bars, and system integration. Config is simple
key-value pairs in `~/.config/ghostty/config`.

## Your Current Config

```
font-family = Dank Mono
font-size = 16
macos-titlebar-style = native
window-decoration = auto
```

---

## Config File Basics

- **Location:** `~/.config/ghostty/config` (preferred for dotfiles)
  - Also supported: `$HOME/Library/Application Support/com.mitchellh.ghostty/config`
- **Syntax:** `key = value` (whitespace around `=` is optional, comments with `#`)
- **Live reload:** `Cmd+Shift+,` reloads config without restarting
- **Modular configs:** Use `config-file = path/to/file` to split into multiple files.
  Prefix with `?` to make optional: `config-file = ?local.conf`
- **Reset to default:** Use blank value, e.g. `font-family =`

### Useful CLI Commands

```bash
ghostty +list-themes      # Browse 300+ built-in themes
ghostty +list-fonts        # Show installed fonts
ghostty +list-keybinds     # Show all default keybindings
ghostty +show-config --default --docs  # Dump all options with documentation
```

---

## Font & Typography

| Option | Description | Example |
|---|---|---|
| `font-family` | Primary font | `Dank Mono`, `JetBrains Mono`, `MesloLGS Nerd Font Mono` |
| `font-size` | Size in points (supports decimals) | `16`, `13.5` |
| `font-thicken` | Thicker stroke on Retina (macOS only) | `true` |
| `font-thicken-strength` | Thickening intensity (0-255) | `1` |
| `font-feature` | OpenType features | `-calt` (disable ligatures) |
| `adjust-cell-height` | Extra vertical spacing in pixels | `1` to `3` |

**Tips:**
- `font-thicken = true` is widely recommended for Retina displays - makes text crisper
- Nerd Fonts are needed for powerline/starship icons: `brew install font-meslo-lg-nerd-font`
- If using Dank Mono, you already have nice italics; consider `font-thicken` for weight

---

## Themes & Colors

Ghostty ships with 300+ built-in themes (iTerm2-compatible color schemes).

```
# Single theme
theme = Catppuccin Mocha

# Follow system light/dark mode
theme = light:rose-pine-dawn,dark:rose-pine
```

**Popular themes:**
- Catppuccin (Mocha, Macchiato, Frappe, Latte)
- TokyoNight Night
- Dracula
- GitHub Dark Default
- rose-pine / rose-pine-dawn
- Argonaut
- Gruvbox Dark

**Tip:** Run `ghostty +list-themes` to preview them interactively.

You can also set individual colors:
```
background = #000000
foreground = #ffffff
```

---

## Window & Titlebar (macOS-Specific)

| Option | Values | Notes |
|---|---|---|
| `macos-titlebar-style` | `native`, `hidden`, `tabs`, `transparent` | `tabs` integrates tabs into titlebar for a clean look; `hidden` maximizes screen space |
| `window-decoration` | `auto`, `none`, `client` | |
| `window-padding-x` | Points | Horizontal padding, e.g. `8` |
| `window-padding-y` | Points | Vertical padding, e.g. `4` |
| `window-width` / `window-height` | Grid cells | Initial window size |
| `window-save-state` | `default`, `never`, `always` | Restore windows on relaunch |
| `window-step-resize` | `true`/`false` | Resize in cell increments (macOS only) |
| `window-title-font-family` | Font name | Separate font for tab/title text |
| `fullscreen` | `true`, `non-native`, `non-native-visible-menu`, `non-native-padded-notch` | Various fullscreen modes |
| `maximize` | `true`/`false` | Start maximized |

**Recommendations:**
- `macos-titlebar-style = tabs` is the most popular choice - clean, minimal look
- `window-padding-x = 8` and `window-padding-y = 4` add breathing room
- `window-save-state = always` is nice for keeping your layout across restarts

---

## Background & Transparency

```
background-opacity = 0.85
background-blur = 16
background = #000000
```

| Option | Description |
|---|---|
| `background-opacity` | 0.0 (fully transparent) to 1.0 (opaque). 0.85-0.98 is the sweet spot |
| `background-blur` | Integer blur radius, or use `macos-glass-regular` / `macos-glass-clear` for native macOS glass effects |
| `background-image` | Path to PNG/JPEG background image |
| `window-colorspace` | `srgb` or `display-p3` |

**Tips:**
- Subtle transparency (0.9-0.95) with blur (16-20) looks great without being distracting
- `background-blur = macos-glass-regular` uses native macOS vibrancy
- Pure black background (`#000000`) works well with transparency on OLED displays

---

## Cursor & Selection

```
cursor-style = block
cursor-color = #ffffff
cursor-click-to-move = true
```

| Option | Values |
|---|---|
| `cursor-style` | `block`, `bar`, `underline`, `block_hollow` |
| `cursor-color` | Hex color, or `cell-foreground` / `cell-background` |
| `cursor-click-to-move` | Click to reposition cursor at shell prompt (requires shell integration) |
| `selection-foreground` / `selection-background` | Hex colors |

---

## Keybindings

Format: `keybind = trigger=action`

### Popular Custom Keybindings

```
# Splits (like iTerm2 / VS Code)
keybind = cmd+d=new_split:right
keybind = cmd+shift+d=new_split:down

# Navigate splits (vim-style)
keybind = cmd+shift+h=goto_split:left
keybind = cmd+shift+j=goto_split:bottom
keybind = cmd+shift+k=goto_split:top
keybind = cmd+shift+l=goto_split:right

# Split management
keybind = cmd+shift+z=toggle_split_zoom
keybind = cmd+shift+e=equalize_splits

# tmux passthrough (if using tmux)
keybind = cmd+s=text:\x01\x73    # tmux prefix + s (save buffer)
keybind = cmd+b=text:\x01\x7a    # tmux prefix + z (zoom pane)
```

### Other Useful Actions

- `reload_config` - Reload configuration
- `toggle_fullscreen` - Toggle fullscreen
- `new_tab` / `previous_tab` / `next_tab` - Tab management
- `close_surface` - Close current pane/tab
- `inspector:toggle` - Open terminal inspector (debugging)

**Tip:** Use `key-remap` to remap modifiers globally, e.g. `key-remap = ctrl=super`.

---

## Shell Integration & Clipboard

```
shell-integration = detect
clipboard-read = allow
clipboard-write = allow
clipboard-trim-trailing-spaces = true
mouse-hide-while-typing = true
scrollback-limit = 10000
```

| Option | Notes |
|---|---|
| `shell-integration` | `detect` (auto), `none`, or specific shell. Enables cursor-click-to-move, pwd tracking, etc. |
| `clipboard-read` / `clipboard-write` | `ask`, `allow`, or `deny` |
| `clipboard-trim-trailing-spaces` | Cleans up copied text |
| `mouse-hide-while-typing` | Auto-hides cursor |
| `mouse-scroll-multiplier` | Adjust scroll speed |
| `scrollback-limit` | Lines of scrollback buffer |
| `env` | Set env vars, e.g. `env = TERM_PROGRAM=ghostty` |

---

## Neovim Integration

Display working directory in Ghostty tab titles:
```lua
-- In your Neovim config
if vim.fn.getenv("TERM_PROGRAM") == "ghostty" then
  vim.opt.title = true
  vim.opt.titlestring = "%{fnamemodify(getcwd(), ':t')}"
end
```

Ghostty ships with Neovim syntax highlighting for its config file. Copy from:
`/Applications/Ghostty.app/Contents/Resources/nvim/site`

---

## Example Configs

### Minimal & Clean

```
font-family = Dank Mono
font-size = 16
font-thicken = true
theme = light:rose-pine-dawn,dark:rose-pine
macos-titlebar-style = tabs
window-padding-x = 8
window-padding-y = 4
```

### Transparent & Aesthetic

```
font-family = JetBrains Mono
font-size = 15
font-thicken = true
font-thicken-strength = 1
adjust-cell-height = 2
theme = Catppuccin Mocha
background-opacity = 0.88
background-blur = 20
background = #000000
macos-titlebar-style = hidden
window-padding-x = 10
window-padding-y = 6
cursor-style = block
mouse-hide-while-typing = true
```

### Power User (with splits & tmux)

```
font-family = MesloLGS Nerd Font Mono
font-size = 14
font-thicken = true
theme = TokyoNight Night
macos-titlebar-style = tabs
window-save-state = always
window-padding-x = 8
window-padding-y = 4
clipboard-read = allow
clipboard-write = allow
clipboard-trim-trailing-spaces = true
mouse-hide-while-typing = true
scrollback-limit = 10000
shell-integration = detect
cursor-click-to-move = true

# Splits
keybind = cmd+d=new_split:right
keybind = cmd+shift+d=new_split:down
keybind = cmd+shift+h=goto_split:left
keybind = cmd+shift+j=goto_split:bottom
keybind = cmd+shift+k=goto_split:top
keybind = cmd+shift+l=goto_split:right
keybind = cmd+shift+z=toggle_split_zoom
keybind = cmd+shift+e=equalize_splits
```

---

## Sources

- [Ghostty Official Docs - Configuration](https://ghostty.org/docs/config)
- [Ghostty Config Reference](https://ghostty.org/docs/config/reference)
- [A Minimal Ghostty Config (That Actually Makes Sense)](https://samuellawrentz.com/blog/minimal-ghostty-config/)
- [Ghostty Terminal: Complete Setup Guide for Mac Development](https://www.bitdoze.com/ghostty-terminal/)
- [Ghostty on macOS - Fredrik Averpil](https://fredrikaverpil.github.io/blog/2024/12/04/ghostty-on-macos/)
- [Ghostty Terminal Setup Guide (gist)](https://gist.github.com/emadabdulrahim/53b69c296ac18c742f00a71fd2079ef7)
- [Setting Up Pretty Mac Terminal in 2026: Ghostty + Starship + Catppuccin](https://medium.com/@yi.cheng/setting-up-the-pretty-mac-terminal-in-2026-ghostty-starship-catppuccin-0420189ad43f)
- [My lil' Ghostty terminal config](https://birchtree.me/blog/my-lil-ghosty-terminal-config-2/)
