# Apache Ranger Docker POC (Proof of Concept)
- Apache Ranger Docker Cluster for POC with Hadoop Environment(HDFS, Hive, Presto)
- [Details](https://kadencho.medium.com/hands-on-apache-ranger-docker-poc-with-hadoop-hdfs-hive-presto-814344a03a17) on my Medium article

# How to start
```bash
docker network create ranger-env

cd docker-composes/ranger
docker-compose up -d --build

cd ../hadoop
docker-compose up -d --build
```

## What happens?
