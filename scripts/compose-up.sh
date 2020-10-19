#!/bin/bash



# Run chrome extension backend

sudo docker-compose up -d -f chrome-extension/test/server/docker-compose.yml


# Run Test Data docker compose file

#sudo docker-compose up -d -f test-data/docker-compose.yaml 
