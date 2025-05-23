set -e

docker pull $DOCKERHUB_USERNAME/portsite:$GITHUB_REF_NAME
docker run -d \
  --name portsite-prod \
  -e NODE_ENV=production \
  -p 80:80 \
  $DOCKERHUB_USERNAME/portsite:$GITHUB_REF_NAME
