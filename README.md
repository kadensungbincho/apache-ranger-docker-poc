# Apache Ranger Docker POC (Proof of Concept)
- Apache Ranger Docker Cluster for POC with Hadoop Environment(HDFS, Hive, Presto)

# How to start
```bash
docker network create ranger-env

cd docker-composes/ranger
docker-compose up -d --build

cd ../hadoop
docker-compose up -d --build
```

## What happens?
