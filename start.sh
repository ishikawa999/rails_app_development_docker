#!/bin/bash

rake db:create
rake db:migrate
rake log:clear

rm tmp/pids/server.pid
tail -f /entrypoint.sh # TODO:レスポンスがないと判断して落ちないようにするためのもの。起動し続ける物じゃないと駄目？
# rdebug-ide --host 0.0.0.0 --port 1233 --dispatcher-port 26162 -- bin/rails server -b 0.0.0.0
