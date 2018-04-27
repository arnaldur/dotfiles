# https://github.com/arnaldur/dotfiles

# My collection of environment config stuff
# for MacOS

# Install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brew install deps
brew install node
brew install neovim
brew install fzf
brew install ripgrep
brew install node

# Bash shortcuts for FZF
$(brew --prefix)/opt/fzf/install

# Secondary level deps
npm install -g git-aware-terminal

# Install shell scripts
cp bash_profile ~/.bash_profile
cp bashrc ~/.bashrc

cp git_completion ~/.git-completion.bash
cp gitconfig ~/.gitconfig
cp -r config ~/.config

# Sublime 3 config files
cp -r sublime_user/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/

