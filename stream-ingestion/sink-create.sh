#!/bin/bash

# Creates a new sink connector using the provided archive.
# The archive has the 2.6.2 version of the Elasticsearch
# Pulsar I/O connector. To upgrade this connector go to
# the following URL:

# https://pulsar.apache.org/en/download/

$PULSAR_HOME/bin/pulsar-admin --admin-url http://localhost:8080 \
  sinks create --tenant public --namespace default \
  --archive ${PWD}/elasticsearch.nar --name es_sink \
  --sink-config-file ${PWD}/sink-config.yaml \
  --inputs sa-demo
