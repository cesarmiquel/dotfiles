# README

This repo has my Tmux and NeoVim configuration files.

## TMux Bindings

These are my most used TMux bindings:

- You can list all session with `tmux list-sessions`
- You can create a new session by exiting tmux with `c-b d` (detach) and then `tmux new -s <session-name>` which creates the session and attaches to it
- `c-b c`: Create new window in the current session
- `c-w`: View all panes / windows
- `c-b c-j`: fzf to a pane / window (using `bin/find-pane.sh`)
- `c-b ,`: rename window
- `c-b %`: Split window into two vertical panes
- `c-b z`: Switch between split panes

## Vim Bindings

These are my most important neovim bindings:

- `<leader>-p` : fuzzy find files
- `<leader>-b` : fuzzy find buffer
- `bd`: delete current buffer
- `c-s-right arrow` or `bn`: next buffer
- `c-s-left arrow` or `bp`: previous buffer
- `v i <key>`: select text between `<key>` where `<key>` can be `'`, `"`,  `(`
- `<leader>` is mapped to the space key in my config

## Powerline

- To install powerline you need to install `pipx` (`sudo apt install pipx`)
- Install powerline with: `pipx install powerline-status`
- Edit `.bashrc` and add the following:

POWERLINE_REPOSITORY_ROOT=/home/miquel/.local/share/pipx/venvs/powerline-status/lib/python3.12/site-packages
POWERLINE_CONFIG_COMMAND=/home/miquel/.local/share/pipx/venvs/powerline-status/bin/powerline-config
. ${POWERLINE_REPOSITORY_ROOT}/powerline/bindings/bash/powerline.sh

- Check the python version (in this case `python3.12`) and make sure those paths exists
- Source your `.bashrc`

## References

- [Nice complete Neovim config](https://github.com/adriankarlen/nvim/)
- [Another nice example](https://github.com/cksidharthan/nvim)
- [Yet another nice example](https://github.com/olimorris/dotfiles)
