# Neovim configuration

This branch is the Omarchy variant of the configuration. It is based on the
LazyVim configuration shipped by Omarchy and adds focused Rust, Lua, and Bash
development support.

## Ownership

The active checkout belongs at `~/.config/nvim`. Omarchy owns the generated
theme specification at `lua/plugins/theme.lua`; that path is intentionally
ignored by Git. Theme switching updates its target under
`~/.local/state/omarchy/current/theme/`.

Do not edit `/usr/share/omarchy` or `/usr/share/omarchy-nvim`. Those are package
files and may be replaced by Omarchy updates.

## Included modules

- Rust LSP through rustaceanvim, rustfmt, crates.nvim, and codelldb
- Rust tests through neotest-rust
- Lua and Bash language servers
- Lua formatting and linting
- Treesitter with a Markdown injection compatibility query
- Gitsigns with current-line blame and Diffview
- Telescope live-grep arguments and UI select
- Neo-tree custom visibility and preview behavior
- Trouble diagnostics and TODO views
- tmux pane navigation when running inside tmux
- CodeCompanion using local Ollama models

GitHub Copilot, C/C++, CMake, and generic C/C++ debugging are intentionally
not included.

## Local AI models

CodeCompanion uses `qwen3:8b` for chat and `qwen2.5-coder:7b` for inline edits
and agents through the local Ollama service. Change the model names in
`lua/plugins/codecompanion.lua` if the local model set changes.

## Checks

Useful Neovim checks include:

```vim
:checkhealth
:Lazy
:Mason
:WhichKey
```

The custom mappings all have descriptions, so WhichKey can display their
available key combinations.
