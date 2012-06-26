$DOTVIM=$HOME/dotvim

echo 'Linking .vimrc';
ln -s $DOTVIM/vimrc $HOME/.vimrc

echo 'Linking .vim';
#@ln -s $DOTVIM $HOME/.vim

for i in ./bundle; do echo 'init $i'; git submodule update --init $i; done
