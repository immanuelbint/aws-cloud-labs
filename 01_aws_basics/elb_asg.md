# Elastic Load Balancing (ELB) & Auto Scaling Groups (ASG)

## Summary Concept

### Cloud Computing Concept

With the concept of high availability, there is scalability, which can be vertical or horizontal, as well elasticity and agility in the cloud. Here's the concept according to these features.

- **High availability**: means your applications are deployed across multiple availability zones.
- **Vertical scaling**: means increase the specification of an instances.
- **Horizontal scaling**: means increase the number of instances. 
- **Elasticity**: ability to scale up and down based on demand. 
- **Agility**: cloud concept that helps you creating and deleting resources very quickly.

### Elastic Load Balancing (ELB)

Allows to distibute traffic across backend of EC2 instances, and it can be spread out across multiple availability zones. ELB also support health check to ensure EC2 instances are healthy.

There are 3 Load Balancer available on AWS
- Application Load Balancer (v2) - HTTP based traffic
    - operate at layer 7 (HTTP)
    - load balancing to multiple HTTP applications across machines
    - load balancing to multiple application on same machine (ex: containers)
    - support HTTP/2 and WebSocket
    - support redirect (example from HTTP to HTTPS)

- Network Load Balancer (v2)
    - operate at layer 4 (TCP and UDP)
    - forward TCP and UDP to your instances
    - handle millions of request per seconds
    - ultra-low latency
    - has one static IP per AZ, and supports assign Elastic IP (helpful for whitelist specific IP)
    - used for extreme performance TCP and UDP traffic

- Gateway Load Balancer
    - operates at layer 3 (Network Layer)
    - deploy and manage a fleet of 3rd party network virtual appliances in AWS (example: firewalls, intrusion detection and prevention, deep packet inspection system, payload manipulation)
    - combines the following function, Transparent Network Gateway (single entry / exit for all traffic) and Load Balancer (distribute traffic to your virtual appliances) 
    - uses GENEVE protocol on port 6081


### Auto Scaling Groups (ASG)

Allows to implement elasticity to our applications by spread our load across multiple availability zones and scaling accordingly. We scale EC2 instances based on demand of your system and can also replace unhealthy instances. Integration between the ASG and the ELB. This integration makes them a great combination. Together, they achieve high availability, scalability, elasticity, and agility in the Cloud.

### ASG Scaling Policies

- Dynamic Scaling
    - Target Tracking Scaling
        - simple to setup
        - Example: want to set average ASG CPU to stay around 40%
    - Simple / Step Scaling
        - when cloudwatch alarm is triggered (example CPU > 70%), then add 2 units
        - when cloudwatch alarm is triggered (example CPU < 30%), then remove 1 unit

- Scheduled Scaling
    - anticipate a scaling based on known usage patterns
    - example: increase the min capacity to 10 at 5 pm on Fridays

- Predictive scaling: continously forecast load and schedule scaling ahead

### Good metrics to scale on ASG

- CPUUtilization (average CPU utilization across your instances)
- RequestCountPerTarget (to make number of request per EC2 is stable)
- Average Network In / Out (if your application is network bound)
- Any custom metric (that you push using cloudwatch)

### Scaling Cooldowns

- After scaling happens, you are in cooldown state (default 300 seconds)
- During cooldown, ASG will not launch or terminate additional instances (to allow metric stabilize)
- Advice: use ready to use AMI to reduce configuration time in order to be serve request faster and reduce cooldown period

## AWS Auto Scaling

- Backbone service of auto scaling for scalable resources in AWS
- Amazon EC2 Auto Scaling Groups: launch or terminate EC2 instances
- Amazon EC2 Spot Fleet requests: launch or terimate instances from a spot fleet request, or automatically replace instances that get interrupted for price of capacity reason
- Amazon ECS: adjust the ECS service desired count up or down
- Amazon DynamoDB (table or global secondary index): WCU & RCU

There are 2 scaling plans available to use in AWS Auto Scaling
- Dynamic scaling: create a target tracking scaling policy
    - Optimize for availability: 40% resource utilization
    - Balance availability and cost: 50% resource utilization
    - Optimize for cost: 70% resource utilization
    - Custom: choose your own metric and target value
    - Options: disable scale-in, cooldown period, warmup time (for ASG)
- Predictive scaling: continously forecast load and schedule scaling ahead
