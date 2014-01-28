#!/bin/bash

# Stop rabbitmq
rabbitmqctl stop_app
# Join cluster
rabbitmqctl join_cluster --ram rabbit@rabbitmq1
# Start rabbitmq
rabbitmqctl start_app
