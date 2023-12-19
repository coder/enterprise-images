# Enterprise Multi Editor

[![Docker Pulls](https://img.shields.io/docker/pulls/codercom/enterprise-multieditor?label=codercom%2Fenterprise-multieditor)](https://hub.docker.com/r/codercom/enterprise-multieditor)

## Description

By default, Coder Enterprise supports
[`code-server`](https://github.com/cdr/code-server) and a terminal application.
Additional IDEs
[require dependencies](https://enterprise.coder.com/docs/installing-an-ide-onto-your-image#required-packages).
This image builds on [enterprise-base](../base/README.md) image by adding those
additional dependencies.

## How To Use It

This image should be extended with the installation of an IDE. For example, see
our [enterprise-goland:ubuntu](../goland/Dockerfile.ubuntu).
