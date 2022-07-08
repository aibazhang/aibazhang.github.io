# Building Batch Data Pipelines on Google Cloud

## EL, ELT, ETL

### EL

- when data can be imported as is into a system
- **if the data is already clean and correct**
- batch load of historical data, scheudled periodic loads of log files (e.g once a day)
- Architecture
  - Extract data from files on Cloud Storage
  - Load it into BigQuery's native storage
  - You can trigger this from Cloud Composer, Cloud Functions, or scheduled queries

### ELT

- EL + transformed whennever it is needed
- experimental datasets where you are not yet sure what kinds of transformations are needed to make the data useable
- any production dataset where the transformation can be expressed in SQL
- Architecture
  - Transform the data on the fly using BigQuery views, or store into new tables

### ETL

- if the transformations cannot be expressed in SQL, or are too complex to do in SQL
- when the raw data needs to be quality-controlled transformed, or enriched before being loaded into BigQuery
- when you want to intgrate with CI/CD systems and perform unit testing on all components
- Architecture
  - Extract data from Pub/Sub, Cloud Storage, Cloud Spanner, Cloud SQL, etc.
  - Transform the data using Dataflow
  - Have Dataflow pipeline write to BigQuery 

### Quality Issues

- Issue
  - Latency, throughput: Dataflow to Bigtable
  - Reusing Spark pipeliens: Dataproc
  - Need for visual pipline building: Cloud Data Fusion
- Tracking lineage in ETL pipelines can be important
  - Discovery: find the data you need
  - Lineage: metadata about the data -> Data Catalog
- Data catalog
  - Simplify data discovery at any scale
    - Fully managed metadata management service with no infrastructure to set up or manage
  - Unified view of all datasets
    - Central and secure data catalog across Google Cloud with metadata capture and tagging
  - Data governance foundation
    - Security compliance with access level controls along with Cloud Data Loss Prevention integration for handling sensitive data

## Executing Spark on Dataproc

- history
  - ~2006 Database
    - bring the data to the processor
  - 2006~2010s Hadoop
    - destibute the processing
    - store the data with the processors
  - 2010s~ Cloud services
    - separate, specialize, and connect
    - data storage services
    - data procesing services
    - messaging services
- Google Cloud provides different storage options for different jobs
  - Cloud Storage
    - primary datastore for google cloud
    - unstructured data
  - cloud bigtable
    - large amounts of sparse data
    - HBase-compliant
    - low latency
    - high scalability
  - BigQuery
    - data warehousing
    - storage API makes this faster than before
    - cloud push down queries to BigQuery refactoring the job