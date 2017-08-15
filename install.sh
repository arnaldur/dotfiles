# https://github.com/arnaldur/dotfiles

# My collection of environment config stuff
# for MacOS

# Brew install deps
brew install node
brew install neovim

# Secondary level deps
npm install -g git-aware-terminal

# Install shell scripts
cp .bash_profile ~
cp .vimrc ~
cp .git-completion.bash
cp -r .config ~

# Sublime 3 config files
cp -r sublime_user/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/

