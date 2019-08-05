# tmux

My tmux configuration

## Usage

```shell
$ xcode-select --install
$ mkdir Github; cd Github
$ git clone https://github.com/gantheory/dotfiles.git; cd dotfiles
$ ./deploy.sh tmux
$ tmux
$ tmux source ~/.tmux.conf
# install tmux plugins: prefix + I
```

## Shortcuts

- prefix: `Ctrl` + `a`
- install plugins: `prefix` + `I`
- clear history" `prefix` + `Ctrl` + `k`
- save/load tmux environment: `prefix` + `s` / `prefix` + `r`

## Plugins

* [tpm](https://github.com/tmux-plugins/tpm)
* [tmux-copycat](https://github.com/tmux-plugins/tmux-copycat)
* [tmux-yank](https://github.com/tmux-plugins/tmux-yank)
* [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect)
