#!/bin/bash



# Run chrome extension backend

sudo docker-compose -f chrome-extension/test/server/docker-compose.yml up -d || true 


# Run Test Data docker compose file

#sudo docker-compose -f test-data/docker-compose.yaml up -d  
