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
