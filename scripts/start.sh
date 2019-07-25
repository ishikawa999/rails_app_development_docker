#!/bin/bash

cd $APP_HOME
rake db:create
rake db:migrate
rake log:clear

rm tmp/pids/server.pid
tail -f /entrypoint.sh # TODO:レスポンスがないと判断して落ちないようにするためのもの。起動し続ける物じゃないと駄目？
# rails s -b 0.0.0.0
