#!/bin/bash

if ! [ -x "$(command -v cmake)" ]; then

	echo -e "\n\tInstalling basic packages...\n"

	sudo apt update
	sudo apt install -y git cmake g++ build-essential

fi

printf "\n\tChecking nvm environment... "

if ! [ -x "$(command -v nvm)" ]; then printf "OK\n"; else

	echo -e "\n\tInstalling NodeJS on nvm environment...\n"

	sudo apt install curl -y
	curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

	source ~/.profile

	nvm install node
	sudo npm i -g yarn

fi

printf "\n\tChecking pyen environment... "

if [ -x "$(command -v pyenv)" ]; then printf "OK\n"; else

	echo -e "\n\tInstalling Python on pyenv environment...\n"

	sudo apt-get install -y git python-is-python3 python3-pip make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl
	sudo pip3 install virtualenvwrapper

	if [ ! -d ~/.pyenv ]; then
		git clone https://github.com/yyuu/pyenv.git ~/.pyenv
		git clone https://github.com/yyuu/pyenv-virtualenvwrapper.git ~/.pyenv/plugins/pyenv-virtualenvwrapper
	fi

	echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
	echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
	echo 'eval "$(pyenv init -)"' >> ~/.bashrc
	echo 'pyenv virtualenvwrapper' >> ~/.bashrc
fi

printf "\n\tChecking docker environment... "

if [ -x "$(command -v docker)" ]; then printf "OK\n"; else


	echo -e "\n\tInstalling Docker environment...\n"

	sudo apt-get update
	sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common

	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

	sudo apt-get update
	sudo apt-get install -y docker-ce docker-ce-cli containerd.io
fi

echo -e "\n\tEND!\n"

exec "$SHELL"

