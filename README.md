# Neovim configuration

This branch is the Omarchy variant of the configuration. It is based on the
LazyVim configuration shipped by Omarchy and adds focused Rune, Rust, C/C++,
Lua, and Bash development support.

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
- C and C++ through clangd, clang-format, clang-tidy, and codelldb
- CMake language support, Treesitter parsing, and CMake Tools build/test commands
- Rune `.rn` filetype support with Rust-based syntax highlighting and the Rune LSP
- Lua and Bash language servers
- Lua formatting and linting
- Treesitter with a Markdown injection compatibility query
- Gitsigns with current-line blame and Diffview
- Telescope live-grep arguments and UI select
- Neo-tree custom visibility and preview behavior
- Trouble diagnostics and TODO views
- tmux pane navigation when running inside tmux
- CodeCompanion using ChatGPT authentication through Codex

GitHub Copilot is intentionally not included.

## Rune setup

Install the Rune language server separately because it is not currently
available in Mason's package registry:

```sh
cargo install rune-languageserver
```

The server command is `rune-languageserver`, and Rune source files use the
`.rn` extension. Rune projects are detected through `Rune.toml`.

## ChatGPT setup

CodeCompanion uses the `gpt-6.1-sol` model for chat, inline edits, and commands
through Codex ACP's ChatGPT authentication. Install `codex-acp`, then authenticate
with ChatGPT when prompted by Codex.

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

## Tmux navigation

The Neovim plugin handles navigation from inside Neovim. The matching root
bindings in `~/.config/tmux/tmux.conf` forward `Ctrl-h/j/k/l` to Neovim when the
active pane is running it, and select a tmux pane otherwise.
