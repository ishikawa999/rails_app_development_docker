# VS Code Remote DevelopmentでRailsアプリケーションのDocker開発環境にVSCodeから接続し、デバッグする

(自分用)

# 利用手順

* このリポジトリを手元にClone

```bash
$ git clone https://github.com/ishikawa999/rails_app_development_docker.git app_name
$ cd /your/path/app_name
```

* .envを書き換える。

* update_devcontainer_setting.rbを実行

```bash
$ ruby update_devcontainer_setting.rb
```

* そのアプリケーション独自の設定や、自分の開発環境用のカスタマイズがしたい場合はscripts/custom_shell.shに書く(entrypointで実行される)

* docker-compose buildする

```bash
$ docker-compose build
```

* VScodeに拡張機能[Remote-Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)をインストール

* VScodeで/your/path/app_nameを開いた状態でRemote Containers: Open Folder in Container...を選択
* 起動したらターミナルで新しいタブを開き、
```bash
$ rails s -b 0.0.0.0
```
* 少し待つとhttp://localhost:[.envで指定したport]でアクセスできるようになる。

※うまく動かなかったらvscode側でrebuildしてみる

## docker-compose.ymlを書き換えずにDBアダプターを切り替え(postgresql, sqlite3などでも同じようにできる)

```bash
$ export RAILS_DB_ADAPTER=mysql2
$ export RAILS_DB_HOST=mysqldb
$ export RAILS_DB_USERNAME=root

$ bundle update
$ bundle install
$ bundle exec rake db:create
$ bundle exec rake db:migrate
$ rails s -b 0.0.0.0
```
