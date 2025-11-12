#!/usr/bin/env bash
set -euo pipefail

DESKTOP="/home/vscode/Desktop"
URL_TOOLS="https://gitlab+deploy-token-209821:3sXfp9wcBqiFjAgYbP-e@gitlab.com/cdac-vega/vega-tools-rv64/-/archive/master/vega-tools-rv64-master.zip"
ARCHIVE_TOOLS="${DESKTOP}/vega-tools-rv64-master.zip"

URL_SDK="https://gitlab+deploy-token-209821:3sXfp9wcBqiFjAgYbP-e@gitlab.com/cdac-vega/vega-sdk/-/archive/master/vega-sdk-master.zip"
ARCHIVE_SDK="${DESKTOP}/vega-sdk-master.zip"

echo "[setup] Preparing Desktop..."
mkdir -p "$DESKTOP"
chown -R vscode:vscode "$DESKTOP"


echo "[setup] Downloading VEGA-TOOLS..."
wget -q --show-progress -O "$ARCHIVE_TOOLS" "$URL_TOOLS"

echo "[setup] Downloading VEGA-SDK..."
wget -q --show-progress -O "$ARCHIVE_SDK" "$URL_SDK"

echo "[setup] Extracting VEGA-TOOLS..."
tar -xzf "$ARCHIVE_TOOLS" -C "$DESKTOP"
echo "[setup] Extracting VEGA-SDK..."
tar -xzf "$ARCHIVE_SDK" -C "$DESKTOP"

echo "[setup] Cleaning up..."
rm -f "$ARCHIVE_SDK"
rm -f "$ARCHIVE_TOOLS"

chown -R vscode:vscode "$DESKTOP"
echo "[ OK ] VEGA Tools ready."
