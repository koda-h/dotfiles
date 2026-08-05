# dotfiles

macOS 上の開発・運用端末を素早く再現するための dotfiles です。

zsh、tmux、Vim、Git、Ghostty の設定に加え、SSH ログ記録、複数ホスト接続、AWS/ECS 接続、peco 検索など、日常の開発・サーバ運用を効率化するスクリプトをまとめています。

## 主な内容

- zsh / Prezto ベースのシェル環境
- tmux のキーバインド、ステータスバー、ペイン操作、ログ保存
- Vim の編集設定、色設定、PHP/CSS/Smarty 向け補完・スニペット
- Git / tig のエイリアス、表示設定、コミットテンプレート
- Ghostty のフォント、クリップボード、ウィンドウ設定
- peco による履歴検索や SSH 接続先選択
- SSH 接続時の tmux ウィンドウ名変更、ログ記録、known_hosts 更新補助
- 複数ホストへの同時 SSH 接続
- AWS / ECS / ConoHa / Docker Compose など運用作業向けの補助コマンド

## セットアップ

`install.sh` を実行すると、Homebrew や必要なツールをインストールし、このリポジトリ内の設定ファイルをホームディレクトリへシンボリックリンクします。

```sh
./install.sh
```

セットアップ対象の主なファイルは以下です。

- `git/.gitconfig`
- `git/.tigrc`
- `git/.gitmessage`
- `vim/.vimrc`
- `zsh/.zshrc`
- `zsh/etc/zlogin`
- `tmux/.tmux.conf`
- `ghostty/config`

## 補助コマンド

`bin/` 配下には、日常作業を短縮するためのコマンドを置いています。

- `ssh`: SSH 接続時に tmux ウィンドウ名を変更し、接続ログを保存するラッパー
- `pssh`: peco で SSH 接続先を選択して接続
- `mssh`: 複数ホストへ tmux ペイン分割で同時接続
- `ecsssh`: ECS ホスト上の対象コンテナへ接続
- `awsssh`: AWS SSM Session Manager 経由の接続補助
- `dc`: `docker compose` の短縮コマンド
- `yaml2json`: YAML を JSON に変換
- `makeCherrypick.sh`: git log から cherry-pick 用スクリプトを生成
- `tmux_logging.sh`: tmux ペインの出力を日時付きでログ保存

## tmux ログ

tmux の新規ウィンドウ・ペイン作成時や SSH 接続時に、ペイン出力をログとして保存します。

```text
~/.tmux/log/YYYYMM/YYYYMMDD/
```

ログファイルには、セッション名、ウィンドウ番号、ペイン番号、ウィンドウ名が含まれます。

