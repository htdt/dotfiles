# Dotfiles

Neovim, Ghostty, and Zsh configuration.

## Dependencies

### apt

```bash
sudo apt install curl zsh ripgrep xclip zsh-autosuggestions zsh-syntax-highlighting
```

### Ghostty

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"
```

### Neovim (via bob)

```bash
# Install bob (neovim version manager)
curl -fsSL https://raw.githubusercontent.com/MordechaiHadad/bob/master/scripts/install.sh | bash

# Install neovim
bob install stable
bob use stable
```

### fzf

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### pyenv

```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
```

### nvm + Node

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
nvm install --lts
```

### Starship prompt

```bash
curl -sS https://starship.rs/install.sh | sh
```

### Zoxide

```bash
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
```

### FiraCode Nerd Font

Download from https://github.com/ryanoasis/nerd-fonts/releases and extract to `~/.local/share/fonts/`.

## Symlinks

```bash
ln -sf ~/Documents/dotfiles/nvim.lua ~/.config/nvim/init.lua
ln -sf ~/Documents/dotfiles/ghostty ~/.config/ghostty/config
ln -sf ~/Documents/dotfiles/zshrc ~/.zshrc
```
