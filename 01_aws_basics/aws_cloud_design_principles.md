# AWS Cloud Best Practice and Design Principle

- Scalability: Scale vertical and horizontal.
- Disposable Resources: servers should be disposable and easily configured.
- Automation: Serverless, Infrastructure as a service, auto scaling.
- Loose Coupling
    - Monolith are applications that do more and more overtime, become bigger and hard to manages.
    - Break it down into smaller, loosely coupled component or use microservices.
    - A change or a failure in one component should not cascade to other components.
- Services, not servers:
    - don't use just EC2 but use managed services, databases, serverless, etc


## The AWS Well-Architected Framework

Consist of 6 pillars that guide good architecture on AWS

- Operational Excellence
- Security
- Reliability
- Performance Efficiency
- Cost Optimization
- Sustainability

These pillars are not competing priorities but rather synergistic. For example, improving operational excellence often enhances cost optimization.