#!/bin/bash

GREEN='\033[0;32m'
RED="\033[0;31m"
NC="\033[0m"

function p_red() {
  printf "\n${RED}$1${NC}\n"
}
function p_green() {
  printf "\n${GREEN}$1${NC}\n"
}

function install() {
  p_red "Updating apt-get..."
  sudo apt-get update

  p_red "Installing nodejs..."
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  sudo apt-get install -y nodejs

  p_red "Installing nvm..."
  sudo curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

  p_red "Installing docker..."
  sudo apt-get install \
      apt-transport-https \
      ca-certificates \
      curl \
      software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository \
     "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) \
     stable"
  sudo apt-get install docker-ce

  p_red "Installing python-pip..."
  sudo apt-get -y install python-pip

  p_red "Installing docker-compose..."
  sudo pip install docker-compose

  p_red "Installing yarn..."
  sudo npm install -g yarn

  p_red "Installing atom..."
  sudo apt-get install atom

  p_red "Installing parcel for atom..."
  sudo apm install parcel

  p_red "Installing chrome..."
  sudo apt-get install google-chrome

  p_red "Installing zsh..."
  sudo apt-get install zsh

  p_red "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  p_red "Installing unzip..."
  sudo apt-get install unzip

  p_red "Installing fonts..."
  sudo mkdir -p /usr/share/fonts/truetype/operator-mono
  sudo unzip .atom/OperatorMono.zip -d /usr/share/fonts/truetype/operator-mono
  sudo fc-cache -f -v

  p_red "Installing atom packages..."
  apm install --packages-file .atom/packages.txt
}

function copyDotFiles() {
  p_red "Copying dot files..."
  cp .zshrc ~/
  cp .gitconfig ~/
  cp .atom/config.cson ~/.atom
  cp .atom/styles.less ~/.atom
}

install
copyDotFiles

p_green "Done! Let's Rock!"
