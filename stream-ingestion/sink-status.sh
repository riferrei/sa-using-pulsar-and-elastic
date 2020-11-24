#!/bin/bash

# Display the status of the sink connector using its name.

$PULSAR_HOME/bin/pulsar-admin --admin-url http://localhost:8080 \
   sinks status --name es_sink
