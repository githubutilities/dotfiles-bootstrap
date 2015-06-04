#!/usr/bin/env bash

INSTALLATION_DIRECTORY="${HOME}"/Developer
DOTFILES_DIRECTORY_NAME=dotfiles
DOTFILES_GIT_REPOSITORY=git@github.com:githubutilities/dotfiles.git

DOTFILES_DIRECTORY_PATH="${INSTALLATION_DIRECTORY}"/$DOTFILES_DIRECTORY_NAME

cd "${INSTALLATION_DIRECTORY}"

if [ ! -e $DOTFILES_DIRECTORY_NAME ]; then
	git clone $DOTFILES_GIT_REPOSITORY $DOTFILES_DIRECTORY_NAME;
	cd $DOTFILES_DIRECTORY_NAME
	echo ""

	echo "Symlink dotfiles into " "${HOME}"/$DOTFILES_DIRECTORY_NAME;
	ln -i $DOTFILES_DIRECTORY_PATH "${HOME}"/$DOTFILES_DIRECTORY_NAME;
	echo "";

	./bootstrap.sh --force;
else
	echo $DOTFILES_DIRECTORY_NAME " existed in " $INSTALLATION_DIRECTORY;
fi 
