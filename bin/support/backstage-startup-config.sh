#!/bin/bash

# psql will fail if PGSSLMODE above it
psql $DATABASE_URL -c \
'CREATE SCHEMA IF NOT EXISTS auth;
CREATE SCHEMA IF NOT EXISTS catalog;
CREATE SCHEMA IF NOT EXISTS search;
CREATE SCHEMA IF NOT EXISTS scaffolder;
CREATE SCHEMA IF NOT EXISTS techdocs;
CREATE SCHEMA IF NOT EXISTS proxy;
CREATE SCHEMA IF NOT EXISTS permission;
CREATE SCHEMA IF NOT EXISTS app;
CREATE SCHEMA IF NOT EXISTS pagerduty;
CREATE SCHEMA IF NOT EXISTS webhooks;
CREATE SCHEMA IF NOT EXISTS kubernetes;
CREATE SCHEMA IF NOT EXISTS analytics;
CREATE SCHEMA IF NOT EXISTS "honeycomb-dashboard";
CREATE SCHEMA IF NOT EXISTS "honeycomb-dashboard-backend";
CREATE SCHEMA IF NOT EXISTS "dora-metrics";'

# set a default PGSSLMODE if it does not exist in the environment
export PGSSLMODE=${PGSSLMODE:-no-verify}

# override base url for review apps
if [ "$BASE_URL" = "https://REVIEW-APP.herokuapp.com" ] && [ -n "$REVIEW_APP_BASE_URL_PREFIX" ] && [ -n "$HEROKU_PR_NUMBER" ]; then
  export BASE_URL="https://${REVIEW_APP_BASE_URL_PREFIX}-pr-${HEROKU_PR_NUMBER}.herokuapp.com"
  echo "Overwriting BASE_URL: $BASE_URL"
fi
