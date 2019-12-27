#!/bin/bash
client=0

while [[ "$#" -gt 0 ]]; do case $1 in
  -c|--client) client=1;;
  *) echo "Unknown parameter passed: $1"; exit 1;;
esac; shift; done

if [ "$client" -eq 1 ]; then
  rm -rf src
  mkdir src/
  moonc -t src/ .
  cp -R assets src/assets
  cp -R cui/libs src/cui/libs
  love src/
else
  exit 0
fi
