package main

import (
	"context"
	"encoding/json"
	"log"
	"math/rand"
	"os"
	"time"

	"github.com/apache/pulsar-client-go/pulsar"
)

const (
	pulsarURLEnvVar = "PULSAR_URL"
	topicNameEnvVar = "TOPIC_NAME"
)

// MessagePayload struct
type MessagePayload struct {
	Timestamp string `json:"@timestamp"`
	X         int    `json:"X"`
	Y         int    `json:"Y"`
	Z         int    `json:"Z"`
}

func main() {

	// Create a Apache Pulsar client
	client, err := pulsar.NewClient(pulsar.ClientOptions{
		URL:               os.Getenv(pulsarURLEnvVar),
		OperationTimeout:  30 * time.Second,
		ConnectionTimeout: 30 * time.Second,
	})
	if err != nil {
		log.Fatalf("Could not instantiate Pulsar client: %v", err)
	}
	defer client.Close()

	// Create a Apache Pulsar producer
	producer, err := client.CreateProducer(pulsar.ProducerOptions{
		Topic: os.Getenv(topicNameEnvVar),
	})
	if err != nil {
		log.Fatalf("Could not instantiate Pulsar producer: %v", err)
	}
	defer producer.Close()

	// Continuously send messages
	rand.Seed(time.Now().UnixNano())
	for {
		messagePayload := MessagePayload{
			Timestamp: time.Now().Format(time.RFC3339),
			X:         rand.Intn(5),
			Y:         rand.Intn(5),
			Z:         rand.Intn(5),
		}
		messageBytes, _ := json.Marshal(messagePayload)
		producer.SendAsync(context.Background(), &pulsar.ProducerMessage{
			Payload: messageBytes,
		}, func(msgId pulsar.MessageID, msg *pulsar.ProducerMessage, err error) {
			if err == nil {
				log.Printf("Message '%s' sent successfully", msgId)
			} else {
				log.Fatalf("Error sending message: %v", err)
			}
		})
		time.Sleep(1 * time.Second)
	}

}
