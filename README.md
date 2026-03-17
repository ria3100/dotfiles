# dotfiles

[chezmoi](https://www.chezmoi.io/) で管理している dotfiles。

## 管理対象

| カテゴリ | ファイル |
|---------|---------|
| シェル | `.zshrc`, `.zshenv`, `.zprofile`, `.vimrc` |
| エディタ | `.config/nvim/` (LazyVim) |
| ターミナル | `.config/ghostty/config`, `.config/starship.toml` |
| プラグイン・キーバインド | `.config/sheldon/plugins.toml`, `.config/karabiner/karabiner.json` |

## セットアップ（別マシンで復元）

```bash
brew install chezmoi
chezmoi init --apply ria3100
```

## 日常の使い方

### 設定ファイルを変更した後

```bash
# 変更を chezmoi に取り込む
chezmoi re-add

# コミット & プッシュ
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
# 差分を確認
chezmoi diff

# 適用シミュレーション（実際には変更しない）
chezmoi apply --dry-run

# 管理中のファイル一覧
chezmoi managed
```

### リモートの変更を取り込む

```bash
chezmoi update
```
