group "default" {
  targets = ["build"]
}

target "build" {
  dockerfile = "Dockerfile.ubuntu"
}

target "cross" {
  inherits = ["build"]
  platforms = ["linux/amd64", "linux/arm64"]
  tags = ["ghcr.io/tuananh/coder-test"]
}