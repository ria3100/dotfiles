# dotfiles

[chezmoi](https://www.chezmoi.io/) で管理している dotfiles。

## セットアップ

新しいマシンでは以下で復元できる。

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install chezmoi
chezmoi init --apply --source ~/dotfiles ria3100
```

`chezmoi init --apply` で以下が自動実行される:

1. Homebrew インストール（未導入の場合）
2. `brew bundle` でパッケージ・アプリ一括インストール
3. macOS システム設定の適用
4. mise で Node.js / pnpm / Python をインストール
5. Rust ツールチェーン (stable + wasm32) セットアップ
6. Vite+ インストール

### 手動で必要な設定

**npm トークン（Keychain に登録）:**

```bash
security add-generic-password -s "npm-github-packages" -a "ria" -w "<token>"
security add-generic-password -s "npm-registry" -a "ria" -w "<token>"
```

## 管理対象

### dotfiles

| カテゴリ | ファイル |
|---------|---------|
| シェル | `.zshrc`, `.zshenv`, `.zprofile`, `.vimrc` |
| エディタ | `.config/nvim/` (LazyVim + fugitive) |
| ターミナル | `.config/ghostty/config`, `.config/starship.toml` |
| プラグイン・キーバインド | `.config/sheldon/plugins.toml`, `.config/karabiner/karabiner.json` |
| パッケージ管理 | `.npmrc` (Keychain テンプレート), `.config/Brewfile` |
| CLI ツール | `.local/bin/gf`, `gf-list`, `nvim-remote` |
| ランタイム | `.config/mise/config.toml` |

### Brewfile

| カテゴリ | 内容 |
|---------|------|
| brew | git, gh, jq, fd, ripgrep, bat, eza, fzf, zoxide, direnv, sheldon, starship, zsh-completions, zellij, neovim, tig, jj, mise, uv, chezmoi, cloudflared, rustup, wasm-pack, cargo-watch |
| cask | Cursor, Ghostty, Google Chrome, Zen, Raycast, ChatGPT, Codex, Notion, Figma, Discord, Slack, OBS, Nani, Elgato Wave Link, Karabiner Elements, azooKey |
| vscode | Cursor 拡張 30個 |

### macOS デフォルト設定

- ダークモード
- キーリピート高速化、長押しアクセント無効
- 自動大文字化・スマートクォート・スペルチェック無効
- Dock 自動非表示、最近のアプリ非表示
- Finder 隠しファイル表示、拡張子表示、パスバー、リスト表示
- タップでクリック
- スクリーンショット保存先: ~/Pictures
- Spaces 自動並び替え無効
- ステージマネージャ無効、デスクトップクリック無効
- メニューバー時計に秒表示
- Safari 開発メニュー有効
- Chrome: メール送信・印刷ショートカット無効化
- Gatekeeper 無効

### セットアップスクリプト

| スクリプト | 内容 |
|-----------|------|
| `run_once_01-install-homebrew.sh` | Homebrew インストール |
| `run_once_02-brew-bundle.sh.tmpl` | brew bundle（Brewfile 変更時に再実行） |
| `run_once_03-ssh-setup.sh` | SSH 設定 |
| `run_once_04-macos-defaults.sh` | macOS システム設定 |
| `run_once_05-dev-tools.sh` | mise install, Vite+, Rust toolchain |

## 日常の使い方

### 設定ファイルを編集する

```bash
# ソースファイルを $EDITOR で開く
chezmoi edit ~/.zshrc

# 編集後にそのまま apply まで実行する
chezmoi edit --apply ~/.zshrc
```

### 新しいファイルを管理対象に追加

```bash
chezmoi add ~/.config/foo/bar.toml
```

### 管理状態の確認

```bash
chezmoi diff
chezmoi apply --dry-run
chezmoi managed
```

### リモートの変更を取り込む

```bash
chezmoi update
```
