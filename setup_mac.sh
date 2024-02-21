#! /bin/zsh

cp ./.zshrc ~/.zshrc
cp ./.p10k.zsh ~/.p10k.zsh
cp ./.iterm2_shell_integration.zsh ~/.iterm2_shell_integration.zsh

# Install brew
if command -v brew &> /dev/null ; then 
  echo 'brew exists'
else 
  echo 'brew does not exists, installing...'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install oh my zsh
if [ -d ~/.oh-my-zsh ]; then
  echo 'oh my zsh installed'
else
  echo 'oh my zsh is not installed, installing...'
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

cp -r ./.oh-my-zsh ~/.oh-my-zsh

# Install nvim
if command -v nvim; then
  echo 'neovim exists';
else 
  echo 'neovim does not exists, installing...'
  brew install neovim
fi

cp -r ./.config/nvim ~/.config/

# Install yazi
brew install yazi ffmpegthumbnailer unar jq poppler fd ripgrep fzf zoxide tako8ki/tap/gobang
brew tap homebrew/cask-fonts && brew install --cask font-symbols-only-nerd-font

brew install lazygit zoxide wget node fzf 
# Install fonts
cp ./font/* ~/Library/Fonts/

# Install iterm
if ! mdfind "kMDItemKind == 'Application'" | grep 'iTerm.app' &> /dev/null; then
  wget -O iterm.zip https://iterm2.com/downloads/stable/latest
  unzip iterm.zip
  mv iTerm.app /Applications
fi

eval "$(zoxide init zsh)"

cp -r ./.config/iterm2_profile ~/.config/

defaults write com.googlecode.iterm2 PrefsCustomFolder -string '~/.config/iterm2_profile'
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
