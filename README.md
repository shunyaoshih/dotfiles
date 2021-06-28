# dotfiles

My configuration files.

## Environment

macOS Catalina

## Install

```shell
$ cd ~; git clone https://github.com/gantheory/dotfiles.git
```

### macOS

```shell
$ xcode-select --install
$ ./install_homebrew.sh
```

### Neovim

```shell
$ ln -s ~/dotfiles/nvim ~/.config/nvim
# Python 3 provider for Neovim.
$ brew install python3
$ pip3 install pynvim
$ brew install neovim
$ nvim +PlugInstall +qall
```

#### Formatter

```shell
# For C, C++, proto, JavaScript, and Arduino.
$ brew install clang-format
# For Python.
$ brew install yapf
# For CSS, JSON, GraphQL, Markdown, YAML.
$ brew install prettier
```

### Fish

```shell
$ ln -s ~/dotfiles/fish ~/.config/fish
$ brew install fish
# add /usr/local/bin/fish to /etc/shells
$ chsh -s /usr/local/bin/fish
```

### Tmux

```shell
$ ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
$ brew install tmux
$ tmux
$ tmux source ~/.tmux.conf
```

### iTerm2

```shell
$ brew install --cask font-hack-nerd-font iterm2
```

- Load iTerm2 settings: `Preferences...` => `General` => `Load preferences from a custom folder or URL`

### Cask Apps

```shell
$ ./dotfiles/scripts/install_homebrew_cask_apps.sh
```
