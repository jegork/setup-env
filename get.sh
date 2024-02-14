cp ~/.iterm2_shell_integration.zsh ~/.p10k.zsh ~/.zshrc .
rsync -a --exclude='**/.git' --exclude='**/.github' --exclude='**/cache' ~/.oh-my-zsh .

mkdir -p .config
cp -r ~/.config/iterm2_profile .config/
cp -r ~/.config/yazi .config/

rsync -a --exclude='**/.git' --exclude="**/.github" --exclude="**/.gitignore" ~/.config/nvim .config/
