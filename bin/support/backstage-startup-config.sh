#!/bin/bash

# psql will fail if PGSSLMODE above it
psql $DATABASE_URL -c \
"CREATE SCHEMA IF NOT EXISTS auth;
CREATE SCHEMA IF NOT EXISTS catalog;
CREATE SCHEMA IF NOT EXISTS search;
CREATE SCHEMA IF NOT EXISTS scaffolder;
CREATE SCHEMA IF NOT EXISTS techdocs;
CREATE SCHEMA IF NOT EXISTS proxy;
CREATE SCHEMA IF NOT EXISTS permission;
CREATE SCHEMA IF NOT EXISTS app;"

# set a default PGSSLMODE if it does not exist in the environment
export PGSSLMODE=${PGSSLMODE:-no-verify}

# override base url for review apps
if [ "$BASE_URL" = "https://CHANGE-ME.herokuapp.com" ] && [ -n "$REVIEW_APP_BASE_URL_PREFIX" ] && [ -n "$HEROKU_PR_NUMBER" ]; then
  export APP_CONFIG_backend_baseUrl="https://${REVIEW_APP_BASE_URL_PREFIX}-pr-${HEROKU_PR_NUMBER}.herokuapp.com"
fi
