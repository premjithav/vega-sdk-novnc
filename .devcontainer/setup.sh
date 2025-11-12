#!/usr/bin/env bash
set -euo pipefail

DESKTOP="/home/vscode/Desktop"
URL_TOOLS="https://gitlab+deploy-token-209821:3sXfp9wcBqiFjAgYbP-e@gitlab.com/cdac-vega/vega-tools-rv64"
URL_SDK="https://gitlab+deploy-token-209821:3sXfp9wcBqiFjAgYbP-e@gitlab.com/cdac-vega/vega-sdk"


echo "[setup] Preparing Desktop..."
mkdir -p "$DESKTOP"
chown -R vscode:vscode "$DESKTOP"

cd $DESKTOP

echo "[setup] Downloading VEGA-TOOLS..."
git clone  "$URL_TOOLS"

echo "[setup] Downloading VEGA-SDK..."
git clone  "$URL_SDK"

cd vega-tools-rv64
./setup-env.sh
cd ../vega-sdk
git checkout aries
./setup.sh
cd ../

chown -R vscode:vscode "$DESKTOP"
echo "[ OK ] VEGA Tools ready."
