#!/usr/bin/env bash

INSTALLATION_DIRECTORY="${HOME}"/Developer
DOTFILES_DIRECTORY_NAME=dotfiles
DOTFILES_GIT_REPOSITORY=git@github.com:githubutilities/dotfiles.git

DOTFILES_DIRECTORY_PATH="${INSTALLATION_DIRECTORY}"/$DOTFILES_DIRECTORY_NAME

# create INSTALLATION_DIRECTORY if not existed
if [ ! -e "${INSTALLATION_DIRECTORY}" ]; then
	mkdir "${INSTALLATION_DIRECTORY}"
fi

cd "${INSTALLATION_DIRECTORY}" 2> /dev/null

if [ $? -ne 0 ]; then
	echo "${INSTALLATION_DIRECTORY}" "cannot be created"
	exit 0
fi

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
