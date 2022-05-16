#!/usr/bin/env bash

set -euo pipefail

IMAGES=(
  # This image must always be built first.
  "base"

  # These must be built first because others build FROM these
  "configure"
  "golang"
  "java"
  "multieditor"
  "node"
  "ruby"
  "vnc"

  # We can build these images in any order
  "android"
  "clion"
  "goland"
  "intellij"
  "jupyter"
  "pycharm"
  "webstorm"
)
