# Needed Ubuntu packages:
* cmake-format
* ripgrep
* rust stuff
* luarocks and then "sudo luarocks --lua-version 5.3.6 install jsregexp"
* fd-find
* lua5.1 (at lest for now as it complained in :checkhealth that 5.3 is not ok)
* python3-venv
* python3-pip
* nodejs (version 22.x for copilot plugin)


# Troubleshooting

## Colors in tmux
For strange colors make sure that you also see :checkhealth in host if there
are some issues with tmux xterm settings. For now I set ~/.tmux.conf in host  
to:

set-option -g default-terminal "screen-256color"

and also set TERM env variable to same value: export TERM='screen-256color'
and also in the container. Then colorscheme works and also response is 
quite faster.

## Tree-sitter + CodeCompanion crash (Neovim 0.12 / Snap)

Symptom:
- Errors like `attempt to call method 'range' (a nil value)`
- Seen in Tree-sitter stack traces, often triggered while using `codecompanion.nvim` chat and/or `spellwarn.nvim`

Cause:
- A compatibility issue in markdown Tree-sitter injections query (`set-lang-from-info-string!`) from `nvim-treesitter` on this setup

Fix (applied in this config):
- Add an override query file at `~/.config/nvim/queries/markdown/injections.scm`
- Use the runtime-safe query style (`@injection.language`) instead of `#set-lang-from-info-string!`

If this appears again after plugin updates:
1. Confirm override is active with `:echo nvim_get_runtime_file('queries/markdown/injections.scm', v:true)`
2. Ensure `~/.config/nvim/queries/markdown/injections.scm` appears first
