set env vars
set -o allexport; source .env; set +o allexport;

echo "Waiting for software to be ready ..."
sleep 60s;


target=$(docker-compose port appsmith 80)


# Set credentials

  sed -i "s|APPSMITH_MAIL_ENABLED=|APPSMITH_MAIL_ENABLED=true|g" ./stacks/configuration/docker.env
  sed -i "s|APPSMITH_MAIL_HOST=|APPSMITH_MAIL_HOST=${EMAIL_HOST}|g" ./stacks/configuration/docker.env
  sed -i "s|APPSMITH_MAIL_PORT=|APPSMITH_MAIL_PORT=${EMAIL_PORT}|g" ./stacks/configuration/docker.env
  sed -i "s|APPSMITH_MAIL_FROM=|APPSMITH_MAIL_FROM=${DEFAULT_FROM_EMAIL}|g" ./stacks/configuration/docker.env

  # docker-compose down;
  # docker-compose up;

#   sleep 60s;

# curl http://${target}/api/v1/users/me \
#   -H 'accept: application/json, text/plain, */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
#   -H 'cache-control: no-cache' \
#   -H 'pragma: no-cache' \
#   -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36' \
#   --compressed

curl http://${target}/api/v1/users/super \
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
  -H 'content-type: application/x-www-form-urlencoded' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36' \
  --data-raw 'name=root&email='$ADMIN_EMAIL'&password='$ADMIN_PASSWORD'&allowCollectingAnonymousData=true&signupForNewsletter=true&role=-&useCase=-' \
  --compressed


# curl http://${target}/api/v1/users/super \
#   -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
#   -H 'content-type: application/x-www-form-urlencoded' \
#   -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36' \
#   --data-raw 'name=root&email=toto782@yopmail.com&password=123456&allowCollectingAnonymousData=true&signupForNewsletter=true&role=-&useCase=-' \
#   --compressed

#   sleep 30s;


# APPSMITH_MAIL_ENABLED=true
# APPSMITH_MAIL_HOST=172.17.0.11722.17.0.1
# APPSMITH_MAIL_PORT=25
# APPSMITH_MAIL_USERNAME=
# APPSMITH_MAIL_PASSWORD=
# APPSMITH_MAIL_FROM=cicd-1v7c8-u353.vm.elestio.app@vm.elestio.app
# APPSMITH_REPLY_TO=


#   # login

  # curl http://${target}/api/v1/login \
  # -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  # -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
  # -H 'cache-control: max-age=0' \
  # -H 'content-type: application/x-www-form-urlencoded' \
  # -H 'upgrade-insecure-requests: 1' \
  # -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36' \
  # --data-raw 'username=toto783@40yopmail.com&password=123456' \
  # --compressed


#   curl http://${target}/api/v1/users/me \
#   -H 'accept: application/json, text/plain, */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
#   -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36' \
#   --compressed



# # getting token
# curl http://${target}/api/v1/applications/new \
#   -H 'accept: application/json, text/plain, */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
#   -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36' \
#   --compressed




# # adding SMTP data to env
#   curl http://${target}/api/v1/admin/env \
#   -X 'PUT' \
#   -H 'accept: application/json, text/plain, */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
#   -H 'content-type: application/json' \
#   -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36' \
#   --data-raw '{"APPSMITH_MAIL_HOST":"172.17.0.1","APPSMITH_MAIL_PORT":"25","APPSMITH_MAIL_FROM":"cicd-1v7c8-u353.vm.elestio.app@vm.elestio.app","APPSMITH_MAIL_SMTP_TLS_ENABLED":false}' \
#   --compressed



# # saving data

# curl 'https://t.appsmith.com/v1/t' \
#   -H 'authority: t.appsmith.com' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
#   -H 'content-type: text/plain' \
#   -H 'origin: https://appsmith-u353.vm.elestio.app' \
#   -H 'referer: https://appsmith-u353.vm.elestio.app/' \
#   -H 'sec-ch-ua: "Chromium";v="106", "Google Chrome";v="106", "Not;A=Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "macOS"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: cross-site' \
#   -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36' \
#   --data-raw '{"timestamp":"2022-11-08T15:20:15.059Z","integrations":{},"userId":"ce1d7975fc29a911973bece16c7365fbbbbd13964219d04a75630967b26193ce","anonymousId":"ba5f2af1-d910-4082-91a0-5a193a8a372a","event":"ADMIN_SETTINGS_SAVE","type":"track","properties":{"method":"Email"},"context":{"page":{"path":"/settings/email","referrer":"https://appsmith-u353.vm.elestio.app/settings/email","search":"","title":"Appsmith","url":"https://appsmith-u353.vm.elestio.app/settings/email"},"userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36","locale":"fr-FR","library":{"name":"analytics.js","version":"next-1.45.0"}},"messageId":"ajs-next-a8fa0aa1b2954f5aa763fceac2b16c6f","writeKey":"aLyfW0WipbrC3WP02i2Zm8SOOJoBSd0o","sentAt":"2022-11-08T15:20:15.087Z","_metadata":{"bundled":["Mixpanel","Segment.io"],"unbundled":[],"bundledIds":["5fae2ce0ff3f6d4cccf2adfa"]}}' \
#   --compressed



# # restarting

#   curl http://${target}/api/v1/admin/restart \
#   -X 'POST' \
#   -H 'accept: application/json, text/plain, */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
#   -H 'content-length: 0' \
#   -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36' \
#   --compressed













#   curl 'https://t.appsmith.com/v1/t' \
#   -H 'authority: t.appsmith.com' \
#   -H 'accept: */*' \
#   -H 'accept-language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7,he;q=0.6' \
#   -H 'content-type: text/plain' \
#   -H 'origin: https://appsmith-u353.vm.elestio.app' \
#   -H 'referer: https://appsmith-u353.vm.elestio.app/' \
#   -H 'sec-ch-ua: "Chromium";v="106", "Google Chrome";v="106", "Not;A=Brand";v="99"' \
#   -H 'sec-ch-ua-mobile: ?0' \
#   -H 'sec-ch-ua-platform: "macOS"' \
#   -H 'sec-fetch-dest: empty' \
#   -H 'sec-fetch-mode: cors' \
#   -H 'sec-fetch-site: cross-site' \
#   -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36' \
#   --data-raw '{"timestamp":"2022-11-08T15:25:44.428Z","integrations":{},"anonymousId":"88a9ec77-8fd3-4496-8f2a-a77695a809ca","event":"LOGIN_CLICK","type":"track","properties":{"loginMethod":"EMAIL"},"context":{"page":{"path":"/user/login","referrer":"","search":"","title":"Applications | Appsmith","url":"https://appsmith-u353.vm.elestio.app/user/login"},"userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36","locale":"fr-FR","library":{"name":"analytics.js","version":"next-1.45.0"}},"messageId":"ajs-next-5d47d67ae0ac91f31418f069873ed18b","writeKey":"aLyfW0WipbrC3WP02i2Zm8SOOJoBSd0o","userId":null,"sentAt":"2022-11-08T15:25:44.435Z","_metadata":{"bundled":["Mixpanel","Segment.io"],"unbundled":[],"bundledIds":["5fae2ce0ff3f6d4cccf2adfa"]}}' \
#   --compressed