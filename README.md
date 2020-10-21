# Enterprise Example Images

These docs contain examples and guides for how to setup your images to utilize
the Multi Editor Support built into Coder Enterprise.

Each directory in [`images/`](./images) contains examples for how to setup your images
with different IDEs.

See our [documentation at our Enterprise Hub](https://enterprise.coder.com/docs/multi-editor) for additional information
about supported editors and known issues.

## Image Minimums

All of the images provided in this repo include the following utilities to ensure they work well
with all of Coder Enterprise's features, and to provide a solid out-of-the-box developer experience:

* git
* bash
* curl & wget
* htop
* man
* vim
* sudo
* python3 & pip3
* gcc & gcc-c++ & make

## Images on Docker Hub

Each of these images is also published to Docker Hub under the `codercom/enterprise-[name]`
repository. For example, `intellij` is available at https://hub.docker.com/r/codercom/enterprise-intellij.
The tag is taken from the file extension of the Dockerfile. For example, `intellij/Dockerfile.ubuntu`
is under the `ubuntu` tag.

## Adding a New Image

To add a new image, create a new folder in `images/` with the name of the image, and create
at least one `Dockerfile` for it, using an extension as the tag. For instance, an Ubuntu-based
version of your image would be in `Dockerfile.ubuntu`.

New images should extend from existing images whenever possible, e.g.
```Dockerfile
FROM codercom/enterprise-base:ubuntu

# Rest of your image...
```
