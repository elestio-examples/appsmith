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
curl http://${target}/api/v1/users/super \
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
  -H 'content-type: application/x-www-form-urlencoded' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36' \
  --data-raw 'name=root&email='$ADMIN_EMAIL'&password='$ADMIN_PASSWORD'&allowCollectingAnonymousData=true&signupForNewsletter=true&role=-&useCase=-' \
  --compressed


echo "Restarting software ..."
sleep 60s;