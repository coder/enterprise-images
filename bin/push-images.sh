#!/usr/bin/env bash
set -euo pipefail

# Some images need to build before others, everything else can go in any order
ORDERED_IMAGES=("base" "multieditor")

function main() {
  # Move to top level
  pushd $(git rev-parse --show-toplevel)

  # Add actions for building each image, maintaining desired image order
  image_dirs=($(ls images))

  for image in ${image_dirs[@]}; do
    # Push each Dockerfile images
    dockerfiles=$(ls images/$image/Dockerfile*)
    for dockerfile in ${dockerfiles}; do
      tag=${dockerfile##*.}
      docker push "codercom/enterprise-$image:$tag"
    done
  done

  # Pop back to original dir
  popd

  echo "Successfully built all images"
}

main
