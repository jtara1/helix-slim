#!/usr/bin/env sh
# precondition: needs to be repo root dir
if [ "$(basename $PWD)" != helix-slim ]; then
  echo "run this script from helix-slim directory"
  exit 1
fi

# precondition: bundles/ should not exist
if [ -d bundles ]; then
  command ls -valh bundles
  read -rp "bundles/ already exists, delete current, creating new bundles? [y/n] " response
  response="$(echo "$response" | tr '[:upper:]' '[:lower:]')"
  if [ $response != y ]; then
    exit 2
  fi
  rm -rfi bundles # interactive (-i)
fi

nix bundle --bundler github:NixOS/bundlers#toArx .#helix-slim
nix bundle --bundler github:NixOS/bundlers#toDEB .#helix-slim
nix bundle --bundler github:NixOS/bundlers#toRPM .#helix-slim

mkdir bundles
cp helix-slim-arx bundles/
cp rpm*/*.rpm bundles/
cp deb*/*.deb bundles/

echo done
command ls -valh bundles
realpath bundles
