#!/bin/bash

# Stops the sink connector on Pulsar using its name.

$PULSAR_HOME/bin/pulsar-admin --admin-url http://localhost:8080 \
   sinks stop --name es_sink
