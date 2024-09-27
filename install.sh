#!/usr/bin/env bash

if [ -n "$(grep -i nixos < /etc/os-release)" ]; then
  echo "Verified this is NixOS."
  echo "-----"
else
  echo "This is not NixOS or the distribution information is not available."
  exit
fi

if command -v git &> /dev/null; then
  echo "Git is installed, continuing with installation."
  echo "-----"
else
  echo "Git is not installed. Please install Git and try again."
  echo "Example: nix-shell -p git"
  exit
fi

echo "Default options are in brackets []"
echo "Just press enter to select the default"
sleep 2

echo "-----"

echo "Ensure In Home Directory"
cd || exit

echo "-----"

read -rp "Enter Your New Hostname: [ default ] " hostName
if [ -z "$hostName" ]; then
  hostName="default"
fi

echo "-----"

backupname=$(date "+%Y-%m-%d-%H-%M-%S")
if [ -d "nix-config" ]; then
  echo "Config exists, backing up to .config/config-backups folder."
  if [ -d ".config/config-backups" ]; then
    echo "Moving current version of config to backups folder."
    mv "$HOME"/zaneyos .config/config-backups/"$backupname"
    sleep 1
  else
    echo "Creating the backups folder & moving config to it."
    mkdir -p .config/config-backups
    mv "$HOME"/zaneyos .config/config-backups/"$backupname"
    sleep 1
  fi
fi

echo "-----"

echo "Cloning & Entering Repository"
git clone https://github.com/AlxTray/nix-config.git
cd nix-config || exit
if [ ! -d "hosts/$hostname" ]; then
  mkdir hosts/"$hostName"
  cp hosts/default/*.nix hosts/"$hostName"
fi  
git add .
sed -i "/^\s*host[[:space:]]*=[[:space:]]*\"/s/\"\(.*\)\"/\"$hostName\"/" ./flake.nix

echo "-----"

installusername="$USER"
sed -i "/^\s*username[[:space:]]*=[[:space:]]*\"/s/\"\(.*\)\"/\"$installusername\"/" ./flake.nix

echo "-----"

echo "Generating The Hardware Configuration"
sudo nixos-generate-config --show-hardware-config > ./hosts/$hostName/hardware.nix

echo "-----"

echo "Setting Required Nix Settings Then Going To Install"
NIX_CONFIG="experimental-features = nix-command flakes"

echo "-----"

sudo nixos-rebuild switch --flake ~/nix-config/#${hostName}
