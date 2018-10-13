#/bin/bash

if [ ! "$(docker ps -a | grep rabbit)" ]; then
    echo "creating rabbitmq docker container \"rabbit\"..."
    docker run -td --hostname rabbit --name rabbit -e RABBITMQ_DEFAULT_USER=user -e RABBITMQ_DEFAULT_PASS=password -p 5671-5672:5671-5672 -p 4369:4369 -p 25672:25672 -p 15672:15672 rabbitmq:3.6.9-management
    docker exec rabbit rabbitmq-plugins enable rabbitmq_management
    docker exec rabbit apt-get update
    docker exec rabbit apt-get install -y wget
    docker exec rabbit rm -rf /var/lib/apt/lists/*
    docker exec rabbit wget http://www.rabbitmq.com/community-plugins/v3.6.x/rabbitmq_delayed_message_exchange-0.0.1.ez
    docker exec rabbit mv rabbitmq_delayed_message_exchange-0.0.1.ez /usr/lib/rabbitmq/lib/rabbitmq_server-3.6.9/plugins/
    docker exec rabbit rabbitmq-plugins enable rabbitmq_delayed_message_exchange
    echo "create docker container \"rabbit\" success."
else
    echo "rabbitmq docker container \"rabbit\" already exists."
fi

if [ ! "$(docker ps | grep rabbit)" ]; then
    echo "stating rabbitmq docker container \"rabbit\"..."
    docker start rabbit
    echo "stat docker container \"rabbit\" success."
else
    echo "rabbitmq docker container \"rabbit\" already started."
fi
