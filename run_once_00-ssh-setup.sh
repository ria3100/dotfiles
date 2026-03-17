#!/bin/bash
set -euo pipefail

SSH_KEY="$HOME/.ssh/id_ed25519_github"

if [ -f "$SSH_KEY" ]; then
  echo "SSH key already exists: $SSH_KEY"
  exit 0
fi

echo "Setting up SSH key..."

# Generate key
ssh-keygen -t ed25519 -f "$SSH_KEY" -N "" -C "$(hostname)"

# Add to Keychain
ssh-add --apple-use-keychain "$SSH_KEY"

# Register with GitHub via gh CLI
if command -v gh &>/dev/null; then
  if ! gh auth status &>/dev/null; then
    echo "Logging in to GitHub..."
    gh auth login -w -p ssh
  fi
  echo "Adding SSH key to GitHub..."
  gh ssh-key add "${SSH_KEY}.pub" -t "$(hostname)"
  echo "SSH key registered with GitHub."
else
  echo "gh CLI not found. Manually add ${SSH_KEY}.pub to GitHub."
fi
