# Enterprise Example Images

> This is mirror of Original Images by Codercom for ARM64

These docs contain examples and guides for how to setup your images to utilize
the Multi Editor Support built into Coder Enterprise.

Each directory in [`images/`](./images) contains examples for how to setup your
images with different IDEs.

See our
[documentation at our Enterprise Hub](https://enterprise.coder.com/docs/multi-editor)
for additional information about supported editors and known issues.

## Image Minimums

All of the images provided in this repo include the following utilities to
ensure they work well with all of Coder Enterprise's features, and to provide a
solid out-of-the-box developer experience:

- git
- bash
- curl & wget
- htop
- man
- vim
- sudo
- python3 & pip3
- gcc & gcc-c++ & make

## Images on Docker Hub

Each of these images is also published to Docker Hub under the
`codercom/enterprise-[name]` repository. For example, `intellij` is available at
https://hub.docker.com/r/codercom/enterprise-intellij. The tag is taken from the
file extension of the Dockerfile. For example, `intellij/Dockerfile.ubuntu` is
under the `ubuntu` tag.

## Contributing

See our [contributing guide](.github/CONTRIBUTING.md).
