#!/bin/bash

# Starts the sink connector on Pulsar using its name.

$PULSAR_HOME/bin/pulsar-admin --admin-url http://localhost:8080 \
   sinks start --name es_sink
