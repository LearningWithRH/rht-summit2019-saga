#!/bin/bash

image_ticket_name=ticket
image_ticket_version=latest

image_debezium_name=debezium-connect
image_debezium_version=latest

############################ Ticket Service

#create image
cd ticket/
mvn package -Pnative -Dnative-image.docker-build=true
docker build -f Dockerfile.native -t ${image_ticket_name}:${image_ticket_version} .

############################ Debezium Connect Service

#create image
cd debezium/
mvn clean install
docker build -f Dockerfile -t ${image_debezium_name}:${image_debezium_version} .