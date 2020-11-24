#!/bin/bash

# Deletes the sink connector from Pulsar using its name.

$PULSAR_HOME/bin/pulsar-admin --admin-url http://localhost:8080 \
   sinks delete --name es_sink
