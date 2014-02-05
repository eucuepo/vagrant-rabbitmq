#!/bin/bash

# Enable mirroring for queues starting with "ha." for any two clusters with automatic mirroring
rabbitmqctl set_policy ha-two "^ha\." \
   '{"ha-mode":"exactly","ha-params":2,"ha-sync-mode":"automatic"}' 
