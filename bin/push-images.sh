#!/usr/bin/env bash
set -euo pipefail

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

  echo "Successfully pushed all images"
}

main
