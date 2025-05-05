#!/usr/bin/env bash
set -euo pipefail

IMAGE="$DOCKERHUB_USERNAME/$IMAGE_NAME:$IMAGE_TAG"

echo "Deploying $IMAGE to Staging…"
docker pull "$IMAGE"
docker run -d \
  --name portsite-staging \
  -p 80:80 \
  "$IMAGE"
