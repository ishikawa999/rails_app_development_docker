#!/bin/bash
{ \
    echo "production:"; \
    echo "  adapter: <%= ENV['RAILS_DB_ADAPTER'] %>"; \
    echo "  database: <%= ENV['RAILS_DB'] %>"; \
    echo "  username: <%= ENV['RAILS_DB_USERNAME'] %>"; \
    echo "  password: <%= ENV['RAILS_DB_PASSWORD'] %>"; \
    echo "  host: <%= ENV['RAILS_DB_HOST'] %>"; \
    echo "  encoding: <%= ENV['RAILS_DB_ENCODING'] %>"; \
    echo "development:"; \
    echo "  adapter: <%= ENV['RAILS_DB_ADAPTER'] %>"; \
    echo "  database: <%= ENV['RAILS_DB'] %>_development"; \
    echo "  username: <%= ENV['RAILS_DB_USERNAME'] %>"; \
    echo "  password: <%= ENV['RAILS_DB_PASSWORD'] %>"; \
    echo "  host: <%= ENV['RAILS_DB_HOST'] %>"; \
    echo "  encoding: <%= ENV['RAILS_DB_ENCODING'] %>"; \
    echo "test:"; \
    echo "  adapter: <%= ENV['RAILS_DB_ADAPTER'] %>"; \
    echo "  database: <%= ENV['RAILS_DB'] %>_test"; \
    echo "  username: <%= ENV['RAILS_DB_USERNAME'] %>"; \
    echo "  password: <%= ENV['RAILS_DB_PASSWORD'] %>"; \
    echo "  host: <%= ENV['RAILS_DB_HOST'] %>"; \
    echo "  encoding: <%= ENV['RAILS_DB_ENCODING'] %>"; \
} | tee config/database.yml

bundle update
bundle install
rake generate_secret_token

/custom_shell.sh

exec "$@"
