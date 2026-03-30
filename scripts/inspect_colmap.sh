#!/usr/bin/env bash
set -euo pipefail

SCENE_NAME="re10k1_scene01"
TXT_DIR="outputs/colmap/${SCENE_NAME}/sparse_txt"

echo "== cameras.txt =="
head -20 "${TXT_DIR}/cameras.txt"

echo
echo "== images.txt =="
head -40 "${TXT_DIR}/images.txt"

echo
echo "== points3D.txt =="
head -20 "${TXT_DIR}/points3D.txt"