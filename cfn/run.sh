#!/usr/bin/env bash

set -xeuo pipefail

image_name="alexa-sampler-cfn"

docker container run \
  -it \
  --rm \
  --volume ${PWD}:/workdir:ro \
  --volume ${HOME}/.aws:/root/.aws:ro \
  "$image_name" \
  $@
