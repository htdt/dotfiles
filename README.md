# Dotfiles

Neovim, Ghostty, and Zsh configuration.

## Dependencies

### apt

```bash
sudo apt install zsh ripgrep xclip zsh-autosuggestions zsh-syntax-highlighting
```

### Ghostty (PPA)

```bash
sudo add-apt-repository ppa:ghostty/release
sudo apt update && sudo apt install ghostty
```

### Neovim (via bob)

```bash
# Install bob (neovim version manager)
# Download latest binary from https://github.com/MordechaiHadad/bob/releases
sudo install bob /usr/local/bin/

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
