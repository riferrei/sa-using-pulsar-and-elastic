#!/bin/bash

# Creates a new sink connector using a provided archive.
# You need to manually download the Pulsar I/O connector
# for Elasticsearch and then rename the downloaded file
# to `elasticsearch.nar`. To download the latest version
# of the connector use the following URL:

# https://pulsar.apache.org/en/download

$PULSAR_HOME/bin/pulsar-admin --admin-url http://localhost:8080 \
  sinks create --tenant public --namespace default \
  --archive ${PWD}/elasticsearch.nar --name es_sink \
  --sink-config-file ${PWD}/sink-config.yaml \
  --inputs sa-demo
