#!/bin/bash
set -euo pipefail

echo "Configuring macOS defaults..."

# Appearance
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

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

# Stage Manager
defaults write com.apple.WindowManager GloballyEnabled -bool false
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

# Menu bar clock
defaults write com.apple.menuextra.clock ShowSeconds -bool true

# Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true

# Google Chrome: disable "Email Link" and "Print" shortcuts
defaults write com.google.Chrome NSUserKeyEquivalents -dict \
  "リンクをメールで送信" "@\$p" \
  "印刷..." "@\$p"

# azooKey
defaults write dev.ensan.inputmethod.azooKeyMac "dev.ensan.inputmethod.azooKeyMac.preference.enableLiveConversion" -bool true
defaults write dev.ensan.inputmethod.azooKeyMac "dev.ensan.inputmethod.azooKeyMac.preference.enableZenzai" -bool true
defaults write dev.ensan.inputmethod.azooKeyMac "dev.ensan.inputmethod.azooKeyMac.preference.typeHalfSpace" -bool true
defaults write dev.ensan.inputmethod.azooKeyMac "dev.ensan.inputmethod.azooKeyMac.preference.zenzaiInferenceLimit" -int 1

# Amphetamine
defaults write com.if.Amphetamine "Hide Dock Icon" -bool true
defaults write com.if.Amphetamine "Start Session At Launch" -bool true
defaults write com.if.Amphetamine "Allow Display Sleep" -bool false
defaults write com.if.Amphetamine "Allow Screen Saver" -bool false
defaults write com.if.Amphetamine "Icon Style" -int 6
defaults write com.if.Amphetamine "Lower Icon Opacity" -bool true
defaults write com.if.Amphetamine "Show Welcome Window" -bool false

# Security
# Gatekeeper: allow apps from anywhere (may require manual override on recent macOS)
sudo spctl --master-disable 2>/dev/null || true

# Restart affected apps
killall Dock Finder 2>/dev/null || true

echo "macOS defaults configured."
