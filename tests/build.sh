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
sed -i "s~jdk-$version/OpenJDK17U-jdk_$(uname -m | sed s/x86_64/x64/)_linux_hotspot_$(echo $version | tr + _).tar.gz~jdk-$(echo $version | sed 's/..$//')/OpenJDK17U-jdk_$(uname -m | sed s/x86_64/x64/)_linux_hotspot_$(echo $version | tr + _ | sed 's/..$//').tar.gz~g" Dockerfile
docker buildx build . --output type=docker,name=appsmith-base | docker load
cd ../../

sed -i "s~ARG BASE~ARG BASE="appsmith-base"~g" Dockerfile
sed -i "s~ARG APPSMITH_CLOUD_SERVICES_BASE_URL~ARG APPSMITH_CLOUD_SERVICES_BASE_URL="https://release-cs.appsmith.com"~g" Dockerfile
docker buildx build . --output type=docker,name=elestio4test/appsmith:latest | docker load
