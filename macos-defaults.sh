#!/bin/bash

# --- Dock --- #
# Set Dock to right
defaults write com.apple.dock "orientation" -string "right"

# Set icons to be smaller
defaults write com.apple.dock "tilesize" -int "36" 

# Enable autohide
defaults write com.apple.dock "autohide" -bool "true"

# Set Dock autohide animation time to 0
# defaults write com.apple.dock "autohide-time-modifier" -float "0"

# Set autohide delay to 0
defaults write com.apple.dock "autohide-delay" -float "0"

# Set Show recents to false
defaults write com.apple.dock "show-recents" -bool "false"

# --- Finder --- #
# Show extensions
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"

# Show path
defaults write com.apple.finder "ShowPathbar" -bool "true"

# Default search scope: this folder. Default option is: SCev (Search all)
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"

# No file extension warning
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"

# Expand save panel
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Always show User Library
chflags nohidden ~/Library/

# --- Desktop --- #
# Hide all Desktop Icons
defaults write com.apple.finder "CreateDesktop" -bool "false"

read -p "Would you like to restart Dock and Finder now? (Y/N): " choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    killall Dock
    killall Finder
    echo "Dock and Finder have been restarted."
else
    echo "Changes applied. Restart Dock and Finder manually to see the effect."
fi
