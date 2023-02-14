#!/usr/bin/env bash
set -euo pipefail

RUBY_MAJOR=2.7
RUBY_VERSION=2.7.7
RUBY_SHA256=e10127db691d7ff36402cfe88f418c8d025a3f1eea92044b162dd72f0b8c7b90
RUBY_DOWNLOAD_PATH=/tmp/ruby.tar.gz
RUBY_SOURCE_DIR=/tmp/ruby-${RUBY_VERSION}

echo "Downloading Ruby ${RUBY_VERSION}..."
curl -fsSL -o ${RUBY_DOWNLOAD_PATH} https://cache.ruby-lang.org/pub/ruby/${RUBY_MAJOR}/ruby-${RUBY_VERSION}.tar.gz

echo "Comparing downloaded file hash..."
echo "${RUBY_SHA256}  ${RUBY_DOWNLOAD_PATH}" | sha256sum -c -

echo "Unzipping Ruby..."
tar -xzf $RUBY_DOWNLOAD_PATH -C /tmp

echo "Installing Ruby..."
pushd ${RUBY_SOURCE_DIR}
./configure
make
make install
popd
