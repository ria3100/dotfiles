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

# Rust: install stable toolchain and wasm target
if command -v rustup &>/dev/null; then
  echo "Setting up Rust toolchain..."
  rustup default stable
  rustup target add wasm32-unknown-unknown
fi
