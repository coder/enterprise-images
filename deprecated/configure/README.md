# Coder Configure

## Description

This directory contains an example [image](./Dockerfile.ubuntu) and
[configure](./configure) script. The configure script is used to add
[`nvm`](https://github.com/nvm-sh/nvm) to a Coder environment.

## How To Use It

If an image contains an executable script located at `/coder/configure`, it is
automatically detected and executed by Coder environments during the build
process.

## Further Reading

Our support site contains
[a tutorial](https://help.coder.com/hc/en-us/articles/360055782794-Configuring-Your-Environment-on-Startup)
on Coder Configure.
