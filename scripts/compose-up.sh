#!/bin/bash



# Run chrome extension backend

sudo docker-compose up -f chrome-extension/test/server/docker-compose.yml -d


# Run Test Data docker compose file

#sudo docker-compose up -f test-data/docker-compose.yaml -d 
