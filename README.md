# ricefields
My dotfiles

# Git Tutorial

# copy repository
git clone --bare https://github.com/suyd/ricefields.git $HOME/.src/
# copy files into home
git --git-dir=$HOME/.src/ricefields.git --work-tree=$HOME checkout
# ignore non important files
git --git-dir=$HOME/.src/ricefields.git --work-tree=$HOME config --local status.showUntrackedFiles no


