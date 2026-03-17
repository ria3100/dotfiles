# dotfiles

[chezmoi](https://www.chezmoi.io/) で管理している dotfiles。

## セットアップ

新しいマシンでは以下の1コマンドで復元できる。

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install chezmoi
chezmoi init --apply ria3100
```

`chezmoi init --apply` で以下が自動実行される:

1. Homebrew インストール（未導入の場合）
2. `brew bundle` でパッケージ・アプリ一括インストール
3. macOS システム設定の適用

`.npmrc` のトークンは macOS Keychain から取得するため、事前に登録が必要:

```bash
security add-generic-password -s "npm-github-packages" -a "ria" -w "<token>"
security add-generic-password -s "npm-registry" -a "ria" -w "<token>"
```

## 管理対象

### dotfiles

| カテゴリ | ファイル |
|---------|---------|
| シェル | `.zshrc`, `.zshenv`, `.zprofile`, `.vimrc` |
| エディタ | `.config/nvim/` (LazyVim) |
| ターミナル | `.config/ghostty/config`, `.config/starship.toml` |
| プラグイン・キーバインド | `.config/sheldon/plugins.toml`, `.config/karabiner/karabiner.json` |
| パッケージ管理 | `.npmrc` (Keychain テンプレート) |

### Brewfile

| カテゴリ | 内容 |
|---------|------|
| brew | git, gh, jq, fd, ripgrep, bat, eza, fzf, zoxide, direnv, sheldon, starship, zsh-completions, zellij, neovim, tig, jj, mise, uv, chezmoi, cloudflared, etc. |
| cask | Cursor, Ghostty, Google Chrome, Zen, Raycast, ChatGPT, Codex, Notion, Figma, Discord, Slack, OBS, Karabiner Elements, etc. |
| vscode | Cursor 拡張 30個 |

### macOS デフォルト設定

キーリピート高速化、Dock 自動非表示、Finder 隠しファイル表示、タップでクリック、スペルチェック無効、Safari 開発メニュー有効、など。

## 日常の使い方

### 設定ファイルを変更した後

```bash
chezmoi re-add
cd ~/.local/share/chezmoi
git add -A
git commit -m "Update dotfiles"
git push
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
