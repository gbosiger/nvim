# Needed Ubuntu packages:
* cmake-format
* ripgrep
* rust stuff
* luarocks and then "sudo luarocks --lua-version 5.3.6 install jsregexp"
* fd-find
* lua5.1 (at lest for now as it complained in :checkhealth that 5.3 is not ok)


# Other issues
For strange colors make sure that you also see :checkhealth in host if there
are some issues with tmux xterm settings. For now I set ~/.tmux.conf in host  
to:

set-option -g default-terminal "screen-256color"

and also set TERM env variable to same value: export TERM='screen-256color'
and also in the container. Then colorscheme works and also response is 
quite faster.
