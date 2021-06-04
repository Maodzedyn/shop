#!/bin/bash
set -e

if [ "$ENV" = 'DEV' ]; then
  echo "Running Development Server"
  exec python "identidock.py"
else
  echo "Running Production Server"
  exec docker --http 0.0.0.0:9090 --wsgi-file /usr/src/app/app.py \
    --callable app --stats 0.0.0.0:9191
fi