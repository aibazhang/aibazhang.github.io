# Data Quality Fundamentals

## Ch01 Why Data Quality Deserves Attention

- Data mesh
- Streaming data
  - forces data teams to rethink their approach to testing and observaing their data
- Rise of the data lakehouse

## Ch02 Assembling the Building Blocks of a Reliable Data System

### Low latency vs. High Throughput

- tradeoff
- Operational DB: low latency
- Analytical DB: high throughput

### Data Warehouses vs. Data Lakes

- data warehouse: table types at the schema level
  - schema-on-write
  - limited flexibility
    - semi-structed data like JSON is not naturally supported
    - bad data often falls through the cracks
  - SQL-only support
    - ML implementations require data to be moved out of a warehouse
    - movement of data often breaks
      - volume
      - freshness
      - schema anomalies occur
  - Frictional workflows
    - when your want to work fast
    - -> struct will be constantly changing
    - -> constant schema change is not something a data warehouse happily support
- data lakes: Manipulations at the file level
  - schema-on-read
  - common features
    - decoupled storage and compute
    - support for distributed compute
    - customization and interoperability
    - largely built on open source tenchnologies
    - ability to handle unstructured or weakly structured data
    - support for sophisticated non-SQL programming models
  - limitation
    - data integrity
      - transformation may fail at any point due to unforeseen upstream changes
    - swampification
      - no one can get any work done because data literacy comes at a high learning curve
    - more endpoints
      - more ways that data can be collected, manipulated, and transformed
      - more opportunity for error
  - points for large quantities of unstructed data
- Data Lakehouse
  - high-performance SQL
    - Presto and Spark
  - schema
    - Parquet
  - atomicity, consistency, isolation, and durability (ACID)
    - Apache Hudi: introduced greater reliability
  - managed services
    - Databricks
    - AWS Glue
  - Likely to rise in popularity in the coming years

### Collecting Data Quanlity Metrics

- Data quality metrics
  - Is the data up-to-date?
  - Is the data compelete?
  - Are fields within expected ranges?
  - Is the null rate higher or lower than it should be?
  - Has the schema changed?
- Using query logs
  - Who is accessing this data?
  - Where dose it come from upstream? Where is it going downstream?
  - How often, on average, it this particular transformation executed?
  - How many rows are affected?
- Designing a data catalog
  - Data Catelog: discovering and organizing the proper metadata that explains your date pipeline
  - A data quality-first catalog
    - Self-service discovery and automation
    - Scalability as data evoloves
    - Data lineage for distributed discovery


## Ch03 Collecting, Cleaning, Transforming, and Testing Data

### Collecting Data

- Application log data
- API Responses
- Sensor Data

### Alerting and Testing

- dbt
- Great Expectations
- Deequ


## Ch04 Monitoring and Anomaly Detection for Your Data Pipelines

- Testing and circuit breakers can handle many of your known unknowns
- Monitoring and anomaly detection can cover your unkown unknowns
- Monitoring
  - Freshness (data since last update)
  - Distribution of metrics
    - completeness
    - distinctness
    - zero rate
    - null rate
    - numeric (mean, min, max, std, percentile)

## Ch05 Architecting for Data Reliability