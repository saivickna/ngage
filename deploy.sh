#!/usr/bin/env bash

echo "stopping running application"
ssh $DEPLOY_USER@$DEPLOY_HOST 'docker stop dodsv'
ssh $DEPLOY_USER@$DEPLOY_HOST 'docker rm dodsv'

echo "pulling latest version of the code"
ssh $DEPLOY_USER@$DEPLOY_HOST 'docker pull nanongage/ngage-db:latest'

echo "starting the new version"
ssh $DEPLOY_USER@$DEPLOY_HOST 'docker run -d --restart=always --name ngage-db -p 49016:8080 nanongage/ngage-db:latest'

echo "success!"

exit 0