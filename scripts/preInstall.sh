set env vars
set -o allexport; source .env; set +o allexport;

mkdir -p ./stacks
mkdir -p ./dockerSock
# chown -R 1000:1000 ./data
