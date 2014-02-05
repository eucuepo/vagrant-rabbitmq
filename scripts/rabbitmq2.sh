#!/bin/bash

# Stop rabbitmq
rabbitmqctl stop_app
# Join cluster
rabbitmqctl join_cluster --ram rabbit@rabbitmq1
# Start rabbitmq
rabbitmqctl start_app
# Enable mirroring for queues starting with "ha." for any two clusters with automatic mirroring
rabbitmqctl set_policy ha-two "^ha\." \
   '{"ha-mode":"exactly","ha-params":2,"ha-sync-mode":"automatic"}'
