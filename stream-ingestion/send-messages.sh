#!/bin/bash

# Keep sending auto-generated messages forever to Pulsar.

export PULSAR_URL=pulsar://localhost:6650
export TOPIC_NAME=sa-demo

go run main.go
