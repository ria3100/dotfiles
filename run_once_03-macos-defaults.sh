#!/bin/bash
set -euo pipefail

echo "Configuring macOS defaults..."

# Keyboard
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 25
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Input
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false

# Dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock tilesize -int 43
defaults write com.apple.dock show-recents -bool false

# Finder
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Trackpad
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Screenshot
defaults write com.apple.screencapture location -string "~/Pictures"

# Mission Control
defaults write com.apple.dock mru-spaces -bool false

# Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true

# Security
# Gatekeeper: allow apps from anywhere (may require manual override on recent macOS)
sudo spctl --master-disable 2>/dev/null || true

# Restart affected apps
killall Dock Finder 2>/dev/null || true

echo "macOS defaults configured."
