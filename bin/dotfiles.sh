#! /usr/bin/env bash
echo "==================== Running Dotfiles Update Script ===================="
set -e

echo "Updating System..."
apt update 
apt upgrade -y

echo "Installing Ansible"
if ! [ -x "$(command -v ansible)" ]; then
    apt install ansible -y
else
    echo "Ansible Already Installed - Skipping"
fi

echo "Running installation script"
echo "Note: If this fails ensure you run this inside the .dotfiles dir"
ansible-playbook --diff "main.yml"
echo ""
echo "============================== Next Steps =============================="
cat nextsteps.md
echo ""
