# Enterprise Example Images

This repository contains example images for use with [Coder](https://coder.com/docs/v2/latest).

- `enterprise-base`: Contains an example image that can be used as a base for
  other images.
- `enterprise-minimal`: Contains a minimal image that contians only the required 
  utilities for a Coder workspace to bootstrap successfully.

## Images on Docker Hub

Each of these images is also published to Docker Hub under the
`codercom/enterprise-[name]` repository. For example, `base` is available at
https://hub.docker.com/r/codercom/enterprise-base. The tag is taken from the
filename of the Dockerfile. For example, `base/ubuntu.Dockerfile` is
under the `ubuntu` tag.

## Contributing

See our [contributing guide](.github/CONTRIBUTING.md).

## Changelog

Reference our [changelog](./changelog.md) for updates made to images.
