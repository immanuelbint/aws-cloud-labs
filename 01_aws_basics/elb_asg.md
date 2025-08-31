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


### Auto Scaling Groups (ASG)

Allows to implement elasticity to our applications by spread our load across multiple availability zones and scaling accordingly. We scale EC2 instances based on demand of your system and can also replace unhealthy instances. Integration between the ASG and the ELB. This integration makes them a great combination. Together, they achieve high availability, scalability, elasticity, and agility in the Cloud.
