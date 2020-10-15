# Enterprise Example Images

These docs contain examples and guides for how to setup your images to utilize
the Multi Editor Support built into Coder Enterprise.

Each directory in [`images/`](./images) contains examples for how to setup your images
with different IDEs.

See our [documentation at our Enterprise Hub](https://enterprise.coder.com/docs/multi-editor) for additional information
about supported editors and known issues.

## Images on Docker Hub

Each of these images is also published to Docker Hub under the `codercom/enterprise-[name]`
repository. For example, `intellij` is available at https://hub.docker.com/r/codercom/enterprise-intellij.
The tag is taken from the file extension of the Dockerfile. For example, `intellij/Dockerfile.ubuntu`
is under the `ubuntu` tag.

## Adding a New Image

To add a new image, create a new folder with the name of the image, and create at least one `Dockerfile`
for it. You'll then want to re-run `bin/generate-actions-yaml.sh` so that a GitHub action is created for
building and pushing that image.
