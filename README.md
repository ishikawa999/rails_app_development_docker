# VS Code Remote DevelopmentでRedmine(Railsアプリケーション)のDocker開発環境にVSCodeから接続し、デバッグする

(自分用)

# 利用手順

* このリポジトリを手元にClone

```bash
$ git clone https://github.com/ishikawa999/rails_app_development_docker.git
$ cd /your/path/rails_app_development_docker
```

* .envを書き換える。CLONE_REPOSITORYなど

* docker-build.shを実行

```bash
$ sh docker-build.sh
```

* VScodeでRemote Containers: Open Folder in Container...を選択
* 起動
```bash
$ rails s -p .envで指定したport -b 0.0.0.0
```
* 少し待つとlocalhost:[,envで指定したport]でアクセスできるようになる。

※うまく動かなかったらvscode側でrebuildしてみる

## docker-compose.ymlを書き換えずにpostgresqlからmysqlに切り替え

```bash
$ export RAILS_DB_ADAPTER=mysql2
$ export RAILS_DB_HOST=mysqldb
$ export RAILS_DB_USERNAME=root

$ bundle update
$ bundle install
$ bundle exec rake db:create
$ bundle exec rake db:migrate
$ rails s -p .envで指定したport -b 0.0.0.0
```
