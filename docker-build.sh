#!/bin/bash

export $(cat .env | grep -v ^# | xargs);

if [ -z "$(ls app)" ]; then
  echo $CLONE_REPOSITORY app
  git clone $CLONE_REPOSITORY -b $BRANCH --depth 1 app
  cp -r .vscode app/.vscode
fi

workdirectory=$(echo $APP_HOME | sed -e "s#/#\\\\/#g")
sed -i -e "s/\/var\/lib\/app/$workdirectory/g" .devcontainer/devcontainer.json

sed -i -e "s/RailsApp Docker/$APP_NAME/" .devcontainer/devcontainer.json
docker-compose build --no-cache
