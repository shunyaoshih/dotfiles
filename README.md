# dotfiles

My configuration files

## Environment

macOS High Sierra

## Usage

### macOS (my personal setup)

#### vim + zsh + tmux + vifm

```shell
$ xcode-select --install
$ mkdir Github; cd Github
$ git clone https://github.com/gantheory/dotfiles.git; cd dotfiles
$ ./deploy.sh all
# add /usr/local/bin/zsh to /etc/shells
$ chsh -s /usr/local/bin/zsh
$ tmux
$ tmux source ~/.tmux.conf
# install tmux plugins: prefix + I
```

#### iTerm2

- Load iTerm2 settings: `Preferences...` => `General` => `Load preferences from a custom folder or URL`
- Font for Powerline: `Preferences...` => `Profiles` => `Text` => `Non-ASCII Font`

#### kitty

```shell
$ cd ~/Github/dotfiles
$ cp ./kitty/kitty.conf ~/.config/kitty/kitty.conf
```

#### Install cask apps

```shell
$ cd ~/Github/dotfiles
$ ./deploy.sh cask
```

#### Workstation

```shell
# need to install vim and tmux first
$ mkdir Github; cd Github
$ git clone https://github.com/gantheory/dotfiles.git; cd dotfiles
$ ./deploy.sh workstation
```

### Vim only

```shell
# install vim 8.0+
$ mkdir Github; cd Github
$ git clone https://github.com/gantheory/dotfiles.git; cd dotfiles
$ ./deploy.sh vim_only
```

check out my vim shortcuts at [here](https://github.com/gantheory/dotfiles/blob/master/vim/README.md).

#### Update

```shell
$ cd ~/Github/dotfiles
$ git pull
$ ./deploy.sh vim_only
```
