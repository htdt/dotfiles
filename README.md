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

bob manages Neovim versions; use it on every machine for a consistent
update workflow (`bob install stable && bob use stable`).

Install bob into `~/.local/bin` (no sudo, no cargo needed):

```bash
cd /tmp
curl -fLO https://github.com/MordechaiHadad/bob/releases/latest/download/bob-linux-x86_64.zip
unzip -o bob-linux-x86_64.zip -d bob-dl
install -m755 "$(find bob-dl -type f -name bob | head -1)" ~/.local/bin/bob
```

Then install Neovim (0.12+ required for nvim-treesitter main branch):

```bash
bob install stable
bob use stable
```

The shared `zshrc` puts `~/.local/share/bob/nvim-bin` first on `PATH`, so bob's
Neovim takes precedence automatically.

### tree-sitter CLI (required by nvim-treesitter `main` branch)

The `main` branch compiles parsers via the `tree-sitter` CLI, so it must be on `PATH`:

```bash
npm install -g tree-sitter-cli   # or: cargo install tree-sitter-cli
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
ln -sf ~/Documents/dotfiles/ghostty ~/.config/ghostty/config   # local terminal only
ln -sf ~/Documents/dotfiles/zshrc ~/.zshrc
ln -sf ~/Documents/dotfiles/tmux.conf ~/.tmux.conf
```

## Per-machine config

`zshrc` is shared across machines. Anything machine-specific (pyenv, project
venvs, CUDA `LD_LIBRARY_PATH`, tmux auto-attach over SSH, etc.) goes in
`~/.zshrc.local`, which is sourced near the end of `zshrc` and is **not** tracked
in this repo. Create it per host.
