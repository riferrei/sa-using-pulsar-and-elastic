#!/bin/bash

# Creates a sink connector for Elasticsearch on Pulsar.

$PULSAR_HOME/bin/pulsar-admin --admin-url http://localhost:8080 \
  sinks create --tenant public --namespace default \
  --sink-type elastic_search --name es_sink \
  --sink-config-file ${PWD}/sink-config.yaml \
  --inputs sa-demo
