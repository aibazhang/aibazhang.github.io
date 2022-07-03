# Preparing for the Google Cloud Professional Exam

## Designing data processing systems

- Designing flexible data representations
  - Dataflow
  - P Collection
- Designing data pipelines
  - Cloud Dataproc
    - processing in memory rather than copying from disk -> make Spark extremely fast
    - Lazy vs. eager execution
    - GCP alternative
      - Kafka -> Cloud Pub/Sub
      - HBase -> Cloud Bigtable (NoSQL)
      - HDFS -> Cloud Storage
  - Cloud Dataflow
    - For Dataflow users, use roles to limit access to only Dataflow Resources not just the Project
    - Dataflow templates open up new options for separation of work, and the means better security and resource accountability
  - BigQuery and Dataflow Solutions
    - If you need more capabilities than a query engine consider Cloud Dataproc or Cloud Dataflow
    - BigQuery analysis
      - Access data in place
      - Run processing directly on that data
    - Dataproc
      - Start cluster, run job, delete cluster
      - Keep data in place on Cloud Storage
      - Run the existing Spark transformations
    - Dataflow
      - Access data in place
      - Run processing directly on that data
- Design data processing infrastructure
  - Cloud Pub/Sub
  - Serverless analytics solution
    - Ingest: Pub/Sub
    - Processing: Dataflow
    - Analysis: BigQuery

## Building and maintaining data processing systems

- Building and maintaining datastructures and datagbases
  - CAP Theorem
    - Consistency
      - Atomicity
      - Consistency
      - Isolation
      - Durability
    - Availabity
      - Basically Available
      - Soft state
      - Eventual consistency
    - Partition Toerance
- Building and operationalizing pipelines
  - Dataflow does batch and streaming
  - Dataflow windowing for streams
  - **Side inputs** in Dataflow
- Building and operationalizing processing infrastructure
  - Scaling streaming beyond BigQuery
    - BigQuery: easy, inexpensive
    - Cloud Bigtable: Low latency/hight-throughput

## Operationalizing machine learning models

- Deploying an ML pipeline
  - As a DE more interested in setting up the framework for data analysis that would be used by a data analyst
- Modeling business processes for analysis and optimization
  - Use a confusion matrix to describe the performance of classification models
  - Schema and performance
    - BigQuery can use nested schema for highly scalable queries
  - Pipeline and performance
    - Avoid input/output wastefulness
      - Don't `SELECT * `, use only the columns you need
      - Filter using `WHERE` as early as possible in your queries
    - Shuffle wisely
      - Be aware of data skew in your dataset
    - Careful use of `GROUP BY`
      - Best when the number of distinct groups is small
      - Grouping by a high-cardinality unique ID is a bad idea
    - Limit UDFs to reduce computational load
  - Table partitioning
  - Bigtable performance
    - A table can have only one index (the row key)

## Ensuring solution quality

- Designing for security and compliance
- Performaing quanlity control
  - Monitor BigQuery with Cloud Monitoring
  - Use TensorBoard to monitor training
- Ensuring Reliability

## Note

- Cloud Storage
  - Transfer Appliance vs. Storage Transfer Service
  - Nearline vs. Coldline
- Dataprep?
- Vertex AI
- Cloud Bigtable
  - Event data in CSV format to be queried for individual values over time windows. Which storage and schema to minimize query costs
  - Tall and narrow tables (based on a new row for each event)
  - Cloud Bigtable instance is extraneous and not needed to export
- Network Connectivity product
- Google Data Studio
  - Minimize cost?
- Cloud Spanner
  - A scale issue requiring a larger database or globally consistent transactions
- IoT Core
  - Does not publish to other services and it doesn't store data
  - Uses Pub/Sub to publish to other services
