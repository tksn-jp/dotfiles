#!/bin/sh

WHERE_FISH=`which fish`

function setFish() {
	chsh -s $WHERE_FISH
}

function addFish() {
	echo $WHERE_FISH >> /etc/shells
	chsh -s $WHERE_FISH
}

if [ setFish || addFish ]; then
	echo 'Fish is default shell now!'
else
	echo 'Failed to set default shell.'
fi

