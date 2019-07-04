# VS Code Remote DevelopmentでRedmine(Railsアプリケーション)のDocker開発環境にVSCodeから接続し、デバッグする

# 利用手順

* このリポジトリを手元にClone

```bash
$ git clone https://github.com/ishikawa999/redmine-docker-vscode.git
$ cd /your/path/redmine-docker-vscode
```

* app以下にRedmineのコードを入れる

```bash
$ git clone https://github.com/redmine/redmine.git app
```

* .vscodeディレクトリ、Gemfile.localをapp以下にコピー
```bash
$ mkdir app/.vscode
$ cp .vscode/launch.json app/.vscode/launch.json
$ cp .vscode/settings.json app/.vscode/launch.json

$ cp Gemfile.local app/Gemfile.local
```

* VScodeでRemote Containers: Open Folder in Container...を選択
* 起動
```bash
$ rdebug-ide --host 0.0.0.0 --port 1233 --dispatcher-port 26162 -- bin/rails server -b 0.0.0.0
```
* redmine-docker-vscodeを開く
* 開いたらデバッグモードでListen for rdebug-ideを選択
* 少し待つとlocalhost:3000でアクセスできるようになる。
* あとはVScode上からbreak pointなどを埋めてデバッグできる


## docker-compose.ymlを書き換えずにpostgresqlからmysqlに切り替え

```bash
$ export RAILS_DB_ADAPTER=mysql2
$ export RAILS_DB_HOST=mysqldb
$ export RAILS_DB_USERNAME=root

$ bundle exec rake db:create
$ bundle exec rake db:migrate
$ rdebug-ide --host 0.0.0.0 --port 1233 --dispatcher-port 26162 -- bin/rails server -b 0.0.0.0
```
