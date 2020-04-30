## Install ZSH & extra
```
sudo apt install -y zsh
chsh -s $(which zsh)
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Install apps
```
sudo apt install -y tmux vim-gtk python3-venv nodejs npm ripgrep
python3 -m venv .env
```

## Coc stuff in vim
```
:CocInstall coc-python coc-highlight coc-ultisnips
:CocCommand python.setInterpreter 
```
