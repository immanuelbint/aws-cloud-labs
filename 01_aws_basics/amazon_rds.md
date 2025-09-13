# Amazon Relational Database Service (RDS)

Managed DB service and use SQL as query language. It's allows you to create databases in cloud that managed by AWS, include:

- Postgresql
- MySQL
- MariaDB
- Oracle
- Microsoft SQL Server
- IBM DB2
- Aurora (AWS proprietary database)

## RDS Backup vs Snapshots

| Backup                                                       | Snapshots                                                                 |
| ------------------------------------------------------------ | ------------------------------------------------------------------------- |
| Backup are continous and allow point in time recovery        | snapshot takes IO operations and can stop database from second to minutes |
| happen during maintenance windows                            | taken on multi AZ don't impact the master, just standby                   |
| when you delete db instance, you can retain automated backup | snapshot are incremental after first snapshot                             |
| backup have retention period you set between 0 and 35 days   | you can copy & share snapshot                                             |
| set retention 0 to disable backup                            | manual snapshot don't expire                                              |


### Aurora for SysOps

- you can associate a priority tier (0-15) on each replica
    - control the failover priority
    - RDS will promote read replica with the highest priority (lowest tier)
    - if replicas have the same priority, RDS promotes the largest in size
    - if replicas have the same priority and size, RDS promotes random replica
- you can migrate an RDS MySQL snapshot to Aurora MySQL Cluster

### Aurora Cloudwatch Metric

- **AuroraReplicaLag**: amount of lag when replicating updates from primary instance
- **AuroraReplicaLagMaximum**: max amount of lag across all DB instance in cluster
- **AuroraReplicaLagMinimum**: min amount of lag across all DB instance in cluster
- If replica lag is high, means the user will have different experience based on which replica they get data from
- **DatabaseConnection**: current number of connection to DB instance
- **InsertLatency**: average duration of insert operations

## Amazon ElastiCache Overview

- Same as RDS to get managed Relational Databases
- ElastiCache is to get managed Redis or Memcached
- Caches are in memory database with really high performance and low latency
- help reduce load off databases for read intensive workloads
- help make your application stateless
- AWS take care of OS maintenance / patching, optimization, setup, config, monitoring, failure recovery and backup
- using elasticache involves heavy application code changes

### ElastiCache - Redis vs Memcached

| REDIS  | MEMCACHED |
|----------|-------|
| Multi AZ with failover   | multi node for partitioning of data (sharding)  |
| Read replicas to scale read and high available    | no high availability (replica)  |
| data dutability using AOF persistence  | non persistent   |
| backup and restore features  | backup and restore (serverless)   |
| support set and sorted sets  | multi thread architecture   |