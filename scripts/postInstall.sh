set env vars
set -o allexport; source .env; set +o allexport;

echo "Waiting for software to be ready ..."
sleep 120s;


target=$(docker-compose port appsmith 80)


# Set credentials

  sed -i "s|APPSMITH_MAIL_ENABLED=|APPSMITH_MAIL_ENABLED=true|g" ./stacks/configuration/docker.env
  sed -i "s|APPSMITH_MAIL_HOST=|APPSMITH_MAIL_HOST=${EMAIL_HOST}|g" ./stacks/configuration/docker.env
  sed -i "s|APPSMITH_MAIL_PORT=|APPSMITH_MAIL_PORT=${EMAIL_PORT}|g" ./stacks/configuration/docker.env
  sed -i "s|APPSMITH_MAIL_FROM=|APPSMITH_MAIL_FROM=${DEFAULT_FROM_EMAIL}|g" ./stacks/configuration/docker.env


# Create user
# curl http://${target}/api/v1/users/super \
#   -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
#   -H 'content-type: application/x-www-form-urlencoded' \
#   -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36' \
#   --data-raw 'name=root&email='$ADMIN_EMAIL'&password='$ADMIN_PASSWORD'&allowCollectingAnonymousData=true&signupForNewsletter=true&role=-&useCase=-' \
#   --compressed

curl https://${DOMAIN}/api/v1/users/super \
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6,zh-CN;q=0.5,zh;q=0.4,ja;q=0.3' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/x-www-form-urlencoded' \
  -H 'pragma: no-cache' \
  -H 'origin: https://'${DOMAIN}'' \
  -H 'referer: https://'${DOMAIN}'/setup/welcome' \
  -H 'user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36' \
  --data-raw 'firstName=admin&lastName=admin&email='$ADMIN_EMAIL'&password='$ADMIN_PASSWORD'&signupForNewsletter=false&name=admin&proficiency=Brand+New&useCase=personal+project&allowCollectingAnonymousData=true'





echo "Restarting software ..."
sleep 60s;