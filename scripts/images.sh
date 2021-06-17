#!/usr/bin/env bash

set -euo pipefail

IMAGES=(
  # These must be built first because others build FROM these
  "base"
  "multieditor"

  # We can build these images in any order
  "android"
  "configure"
  "goland"
  "golang"
  "intellij"
  "java"
  "jupyter"
  "node"
  "pycharm"
  "ruby"
  "vnc"
  "webstorm"
  "clion"
)
