cd app/client/
yarn install --immutable
yarn run check-types
export REACT_APP_ENVIRONMENT=PRODUCTION
export REACT_APP_VERSION_EDITION="Community"
yarn build
cd ../../

cd app/server/
mvn --batch-mode -DgenerateBackupPoms=false -DprocessAllModules=true
./build.sh -DskipTests
cd ../../

cd app/client/packages/rts
yarn install --immutable
yarn build
cd ../../../../

cd deploy/docker
mv base.dockerfile Dockerfile
sed -i 's~/jdk-$version/~/jdk-$(echo $version | sed 's/..$//')~g' Dockerfile
sed -i 's~$(echo $version | tr + _)~$(echo $version | tr + _ | sed 's/..$//')~g' Dockerfile
echo $DOCKER_PASSWORD | docker login  -u $DOCKER_USERNAME --password-stdin
docker buildx build --platform linux/amd64,linux/arm64 -t elestio4test/appsmith-base:latest . --push
cd ../../

sed -i "s~ARG BASE~ARG BASE="elestio4test/appsmith-base"~g" Dockerfile
sed -i "s~ARG APPSMITH_CLOUD_SERVICES_BASE_URL~ARG APPSMITH_CLOUD_SERVICES_BASE_URL="https://release-cs.appsmith.com"~g" Dockerfile
docker buildx build . --output type=docker,name=elestio4test/appsmith:latest | docker load