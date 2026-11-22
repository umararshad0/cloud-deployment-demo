#!/usr/bin/env bash

set -Eeuo pipefail

PROJECT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
DOCUMENT_ROOT="/var/www/cloud-deployment-demo/public"

echo "Deploying website to ${DOCUMENT_ROOT}..."

sudo install -d -m 0755 "$DOCUMENT_ROOT"
sudo install -m 0644 \
    "$PROJECT_DIR/index.html" \
    "$PROJECT_DIR/style.css" \
    "$DOCUMENT_ROOT/"
sudo systemctl reload apache2

echo "Deployment completed successfully."
