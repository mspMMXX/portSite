set -e

docker pull $DOCKERHUB_USERNAME/portsite:$GITHUB_SHA
docker run -d \
  --name portsite-staging \
  -e NODE_ENV=staging \
  -p 80:80 \
  $DOCKERHUB_USERNAME/portsite:$GITHUB_SHA
