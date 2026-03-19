#!/bin/bash
set -euo pipefail

# mise: install runtimes
if command -v mise &>/dev/null; then
  echo "Installing mise tools..."
  mise install
fi

# Vite+: install vp command
if ! command -v vp &>/dev/null; then
  echo "Installing Vite+..."
  curl -fsSL https://vite.plus | bash
fi

# yazi: install plugins and flavors
if command -v ya &>/dev/null; then
  echo "Setting up yazi plugins..."
  ya pkg add yazi-rs/plugins:git 2>/dev/null || true
  ya pkg add yazi-rs/plugins:no-status 2>/dev/null || true
  ya pkg add sanjinso/monokai-vibrant 2>/dev/null || true
fi

# oxc: install oxlint and oxfmt
if command -v npm &>/dev/null; then
  echo "Installing oxc tools..."
  npm i -g oxlint oxfmt
fi

# Rust: install stable toolchain and wasm target
if command -v rustup &>/dev/null; then
  echo "Setting up Rust toolchain..."
  rustup default stable
  rustup target add wasm32-unknown-unknown
fi
