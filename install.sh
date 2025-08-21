#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Give people a chance to retry running the installation
trap 'echo "Installation failed. Please try again by running: source ~/.local/share/ubuntu-fresh-install/install.sh"' ERR

# Check to make sure the system is compatible
echo "Checking system compatibility..."
source ~/.local/share/ubuntu-fresh-install/install/check-version.sh

# Start the installs
echo "Get ready as updates are applied to your fresh Ubuntu installation..."
# Install app-gum
source ~/.local/share/ubuntu-fresh-install/install/terminal/required/app-gum.sh >/dev/null
# Ask for user identification
source ~/.local/share/ubuntu-fresh-install/install/identification.sh
# Install mise
source ~/.local/share/ubuntu-fresh-install/install/terminal/required/mise.sh

# Desktop software and tweaks will only be installed if we're running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # Ensure computer doesn't go to sleep or lock while installing
  gsettings set org.gnome.desktop.screensaver lock-enabled false
  gsettings set org.gnome.desktop.session idle-delay 0

  echo "Installing terminal and desktop tools..."

  # Install terminal tools
  source ~/.local/share/ubuntu-fresh-install/install/terminal.sh

  # Install desktop tools and tweaks
  source ~/.local/share/ubuntu-fresh-install/install/desktop.sh

  # Revert to normal idle and lock settings
  gsettings set org.gnome.desktop.screensaver lock-enabled true
  gsettings set org.gnome.desktop.session idle-delay 300
else
  echo "Only installing terminal tools..."
  source ~/.local/share/ubuntu-fresh-install/install/terminal.sh
fi