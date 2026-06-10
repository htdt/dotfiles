# Shared zsh config (symlinked from the dotfiles repo on every machine).
# Machine-specific bits (venvs, pyenv, CUDA, tmux auto-attach) live in
# ~/.zshrc.local, which is NOT tracked in the repo. See the source line below.

[ -f ~/.secrets ] && source ~/.secrets

# True color: Ghostty sets COLORTERM locally, but SSH doesn't forward it and
# tmux doesn't propagate it to panes. Re-assert it so vim/claude see truecolor.
export COLORTERM="${COLORTERM:-truecolor}"

# History.
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE

# Completion.
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# PATH / toolchains.
export PATH="$HOME/.local/share/bob/nvim-bin:$HOME/.local/bin:$PATH"
export DOTNET_ROOT="$HOME/.dotnet"
export PATH="$HOME/.dotnet:$PATH"
[ -r "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

# fzf + ripgrep.
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Plugins.
[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
command -v starship >/dev/null && eval "$(starship init zsh)"

# Aliases.
alias clip='xclip -selection clipboard'
alias v='nvim'
alias rg='rg --smart-case'
alias g='git'

alias ls='ls --color=auto'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'
alias lt='ls -ltrh'  # oldest first

# rsync deploy helpers.
yeet() {
    local remote="${1:?Usage: yeet user@host:/path}"
    rsync -avz --delete --exclude='.git' --filter=':- .gitignore' . "$remote"
}

yeeta() {
    local remote="${1:?Usage: yeeta user@host:/path}"
    rsync -avz --delete . "$remote"
}

# Machine-specific overrides: pyenv/venv on the laptop, CUDA + tmux auto-attach
# on the GPU box, etc. Sourced last so a machine can override anything above.
[ -r ~/.zshrc.local ] && source ~/.zshrc.local

# zsh-syntax-highlighting must be sourced last to wrap the final widgets.
[ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
