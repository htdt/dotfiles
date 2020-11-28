```
sudo apt install -y zsh
chsh -s $(which zsh)
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo apt install -y tmux python3-venv nodejs npm ripgrep

git clone https://github.com/vim/vim.git
cd src
make distclean  # if you build Vim before
make
sudo make install

python3 -m venv .env
```
