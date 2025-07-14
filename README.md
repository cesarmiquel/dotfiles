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

- Install `powerline` and `powerline-gitstatus` with `sudo apt get <package>`
- Link configuration: `ln -sf /home/miquel/Develop/dotfiles/powerline ~/.config/powerline`
- Add the following lines to your `.bashrc` file:

```
POWERLINE_REPOSITORY_ROOT=/usr/share
POWERLINE_CONFIG_COMMAND=/usr/bin/powerline-config
. ${POWERLINE_REPOSITORY_ROOT}/powerline/bindings/bash/powerline.sh
```


## References

- [Nice complete Neovim config](https://github.com/adriankarlen/nvim/)
- [Another nice example](https://github.com/cksidharthan/nvim)
- [Yet another nice example](https://github.com/olimorris/dotfiles)
