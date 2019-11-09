#!/bin/bash

###################
# Install ansible #
if ! grep -q "ansible/ansible" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    echo "Adding Ansible PPA"
    sudo apt-add-repository ppa:ansible/ansible -y
fi

if ! hash ansible >/dev/null 2>&1; then
    echo "Installing Ansible..."
    sudo apt-get update
    sudo apt-get install software-properties-common ansible git -y
else
    echo "Ansible already installed"
fi

####################################
# make a local copy of the setup that can be tweaked
if [ ! -f setup.yml ]; then
    cp setup.dist.yml setup.yml
fi

#####################################
# Display real installation process #
echo ""
echo "To install the provided applications run ansible with: "
echo "  ansible-playbook setup.yml --ask-become-pass"
echo "Feel free to remove unwanted applications or configurations by removing them from the 'setup.yml'"
echo ""
