set -euo pipefail

: "${DOCKERHUB_USERNAME:?DOCKERHUB_USERNAME must be set}"
: "${IMAGE_TAG:?IMAGE_TAG must be set}"

IMAGE_NAME="${IMAGE_NAME:-portsite}"

IMAGE="${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}"

echo "→ pulling image '$IMAGE'"
docker pull "$IMAGE"

echo "→ stopping old container (if exists)"
docker rm -f portsite-staging || true

echo "→ running container"
docker run -d --name portsite-staging -p 80:80 "$IMAGE"

