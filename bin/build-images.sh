#!/usr/bin/env bash
set -euo pipefail

# Some images need to build before others, everything else can go in any order
ORDERED_IMAGES=("base" "multieditor")

function main() {
  # Move to top level
  pushd $(git rev-parse --show-toplevel)

  # Run on each image, but use an order that has ORDERED_IMAGES run first
  image_dirs=($(ls images))
  all_images=("${ORDERED_IMAGES[@]}" "${image_dirs[@]}")
  seen_images=()

  for image in ${all_images[@]}; do
    # Skip image if we've already seen it, duplicates come from ORDERED_IMAGES
    if [[ "${seen_images[@]}" =~ "${image}" ]]; then
      continue
    fi
    seen_images+=("$image")

    # Build each Dockerfile image
    dockerfiles=$(ls images/$image/Dockerfile*)
    for dockerfile in ${dockerfiles}; do
      tag=${dockerfile##*.}
      echo "Building codercom/enterprise-$image:$tag..."
      docker build ./images/$image --file "./images/$image/Dockerfile.$tag" --tag "codercom/enterprise-$image:$tag" --quiet
    done
  done

  # Pop back to original dir
  popd

  echo "Successfully built all images"
}

main
