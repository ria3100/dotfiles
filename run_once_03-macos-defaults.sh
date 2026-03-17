#!/bin/bash
set -euo pipefail

echo "Configuring macOS defaults..."

# Keyboard
# KeyRepeat: 2 (fast), InitialKeyRepeat: 25 (short delay)
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 25

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 43
defaults write com.apple.dock show-recents -bool false

# Finder
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv" # List view

# Trackpad
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Screenshot
defaults write com.apple.screencapture location -string "~/Pictures"

# Spell check
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false

# Restart affected apps
killall Dock Finder 2>/dev/null || true

echo "macOS defaults configured."
