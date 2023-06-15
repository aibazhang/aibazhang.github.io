# Designing Data Intensive Applications

## Part 1. Foundations of Day System

### Ch1. Reliable, Scalable, and Maintainable Applications

- Reliability
  - Making systems work correctly, even when faults occur
  - in hardware (random and uncorrelated)
  - in software (bugs are systematic and hard to deal with)
  - humans (who make mistakes from time to time)
- Scalability
  - Keeping performance good, even when load increases
  - You can add processing capacity in order to remain reliable under high load
- Maintainability
  - Making life better for the engineering and operations teams
  - Good abstractions
  - Having good visibility into the system's health and having effective way of managing it

### Ch2. Data Model and Query Languages

- Data Model: How the software is written. How we think about the problem that we are solving
  - Relational
    - Good for representing many-to-many relationships
    - Schema-on-write: the schema is explicit and the database ensures all written data conforms to it
  - Document
    - Relationship between one document and another are rare
    - Greater scalability than relational databases can easily achieve
    - Use it if your the data in your application has document-like structure
    - Schema-on-read: Only interpreted when the data is read (similar to dynamic type checking)
  - Graph
    - Anything is potentially related to everything
- Query Languages
  - Declarative query language
    - SQL, CSS styling
    - How your want the data to be transformed
    - Hides implementation details of the database engine
  - Imperative query language
    - How to achieve the goal
  - MapReduce querying
    - A fairly low-level programming model
    - Higher-level query languages like SQL can be implemented as a pipeline of MapReduce operations

## Part 2. Distributed Data

- OLTP (optimized for transaction processing)
  - Huge volume of requests but small number of records in each query
  - Random-access, low-latency writes
    - End user/customer
    - Via web application
  - Fetch by key -> storage engine uses an index to find the data
    - Log-structured
      - SSTable
      - LSM-trees
      - (LevelDB, AWS S3, RocksDB)
    - Update-in-place (B-tree)
      - Major RDB
      - Many nonrelational ones
  - Bottleneck: disk seek time
- OLAP (optimized for analytics processing)
  - Handle lower volume of queries but huge records
  - Bulk import (ETL) or event stream
    - Primarily used by enterprise business analyst.
      - Unnecessary for small amount of data (<TB)
      - Small data can be analyzed by spreadsheet and notebook
    - Visualization -> Decision support
    - Prepare data for data-driven features (recommendation)
  - columns-oriented storage is a popular solution
    - Also applied to nonrelational data (ex. Parquet)
    - Columns compression
  - Star and Snowflakes: schemas for analytics
    - Denormalization
      - Relational -> Star schema (or snowflakes) -> unnormalize
      - Datamart is often Star schema unnormailzed table
    - Start schema
      - Fact table
        - Represents an event
        - Over 100 columns
      - Dimension tables
        - Represent the who, what, where, when, how, and why of the event
  - Bottleneck: disk bandwidth

## Part 3. Derived Data

- Compatibility
  - **Backward Compatibility: new code can read old data**
  - **Forward Compatibility: old code can read new data**
- Encoding Formats
  - Programming language-specific encoding
    - Very transient purpose
    - Marshal (Ruby), pickle (Python) ...
  - Textual formats
    - JSON
      - Distinguishes strings and numbers (but doesn't distinguish integers and floating-point)
      - Problem when dealing with large numbers
      - Good support for Unicode but not binary strings
      - Optional schema support
    - XML
      - Good support for Unicode but not binary strings
      - Optional schema support
    - CSV
  - Binary schema-driven formats
    - Apache Thrift (by Facebook) and Protocol Buffers (by Google)
      - Require a schema
      - Field tags
        - Can change the name of a field
        - Cannot change a field's tag
      - Backward and forward compatibility
      - ProtoBuffer: It's okay to change an optional (single-valued) field into a repeated (multi-valued) field
      - Thrift: support nested list
    - Arvo (subproject of Hadoop)
      - Nothing to identify fields or their datatypes
        - Friendlier to Dynamically generated schemas
          - Fairly easily generate an Avro schema from the relational schema and encode the database content
        - Useful in conjunction with dynamically typed data processing languages
      - Uses the writer's schema (encode) and the reader's schema (decode)
        - don't have to be the same
        - a field in the writer's schema, not in the reader's schema
          - igonore
        - a field in the reader's schema, not in the writer's schema
          - filled in with a default value
- Modes of Dataflow
  - Through Database
    - One process writes encoded data, and another process reads it again sometime in the future
    - Through Services
      - REST
        - A design philosophy that builds upon the principles of HTTP
      - SOAP
        - XML-based protocol making network API requests
      - RPC (Remote procedure call)
        - Different form a local function call
          - Unpredictable: the request or response maybe lost
          - may return without a result due to a timeout
          - Need a mechanism for deduplication (idempotence)
          - Lantency
          - parameters need to encoded into a sequence of bytes
            - becomes problematic with larger objects
          - Must translate datatype from one language into another
        - Custom RPC protocols with a binary encoding format
          - Better performance than JSON over REST
          - Compatibility
            - often used for communication across organizational boundaries
      - Service-oriented/micro-services
        - make the application easier to change and maintain by making services independently deployable and evolvable
- Message-Passing Dataflow
  - Asynchronous
    - the sender doesn't wait for the message to be delivered, but simply sends it and then forgets about it
  - Message Brokers
    - One process sends message to a named queue or topic
      - A topic provides only one-way dataflow
    - Broker ensures that the message is delivered to one or more consumers of subscribers to that queue or topic
      - Many producers and many consumers on the same topic

### Ch.10 Batch Processing

- Batch Processing with Unix Tools
- MapReduce and Distributed System
- Beyond MapReduce

### Ch.11 Stream Processing

### Ch.12 The Future of Data Systems
