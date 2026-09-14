#!/usr/bin/env bash
set -e
for tool in php composer; do
  if ! command -v "$tool" >/dev/null 2>&1; then
    echo "$tool is required. Install it, then run this script again."
    exit 1
  fi
done
cd "$(dirname "$0")/PetConnect"
[ -d vendor ] || composer install
if [ ! -f .env ]; then
  cp .env.example .env
  echo "Created PetConnect/.env."
  echo "Add your local MySQL settings and a SEED_TOKEN, then run this script again."
  exit 1
fi
if command -v open >/dev/null 2>&1; then open http://localhost:8000
elif command -v xdg-open >/dev/null 2>&1; then xdg-open http://localhost:8000
fi
php -S localhost:8000 index.php
