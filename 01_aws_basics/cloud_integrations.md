# AWS Cloud Integration

### Amazon Simple Queue Service (SQS)

is a queuing service in AWS that allows multiple producers to send messages into an SQS queue. Messages are retained in the queue for up to 14 days before they are deleted. Consumers read messages from the queue and share the reads, effectively splitting the workload. Once a message is read and processed by a consumer, it is deleted from the queue. Mainly used to decouple application within AWS.

### Amazon Simple Notification Service (SNS)

is a notification service in AWS that involves producers and subscribers. Subscribers can be email endpoints, AWS Lambda functions, SQS queues, HTTP endpoints, or mobile devices. When multiple subscribers are attached to a single SNS topic, SNS sends a message to all of them. SNS does not retain any messages. Mainly used for pub/sub messaging, topics, and notification within AWS.

### Amazon Kinesis

Is real-time data streaming service that provides data persistence, also allows running analytics on streaming data in real-time, enabling immediate insight and processing.

### Amazon MQ

Amazon MQ is a managed message broker service for ActiveMQ and RabbitMQ in the cloud. It is suitable for migrating from on-premises messaging systems to the cloud and supports protocols such as MQTT and AMQP.

## Key Takeaways

- Amazon Simple Queue Service (SQS) is a queuing service that supports multiple producers and messages are kept up to 14 days.
- Amazon Simple Notification Service (SNS) is a notification service that supports multiple subscribtion but does not retain messages.
- Amazon Kinesis provides real time data streaming with data persistence and analytics capabilities.
- Amazon MQ is managed message broker service that support protocols like MQTT and AMQP for cloud migration.