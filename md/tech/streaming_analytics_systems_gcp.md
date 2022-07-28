# Streaming Analytics Systems GCP

## Processing streaming data

- Bounded Data (Batch)
  - Finite data set
  - Usually complete
  - Time of elements is usually disregarded
  - Typically at rest
  - Held in durable storage
- Unbounded Data (Stream)
  - Infinite data set
  - Never complete
  - Time of elements is usually significant
  - Typically in motion
  - Held in temporary storage
- GCP
  - Pub/Sub: changing and variable volumes of data
  - Dataflow: Process data without undue delays
  - BigQuery: Need ad-hoc analysis and immediate insights

## Pub/Sub

- Pub/Sub provides both Push and Pull delivery
  - Push
    - Steps
      - 1. Subscriber <--Mgs-- Topic
      - 2. Subscriber --ACK--> Topic
    - Acknowledgement used for dynamic rate control
    - Only have one web endpoint -> only have one subscriber
    - That one subscriber could be an app Engine Starndard App or Cloud Run Container images which auto scales
    - One web end point, it can have autoscale workers behind the scenes
  - Pull
    - Steps
      - 1. Subscriber --Pull--> Topic
      - 2. Subscriber <--Mgs-- Topic
      - 3. Subscriber --ACK--> Topic
    - Messages are stored up to 7 days
    - Subscribers can work as a team or separately
- Publishing with Pub/Sub code
  - Create topic `gcloud pubsub topics create sandiego`
  - Publish to topic `gcloud pubsub topics publish sandiego --message "hello"`
  - Create a client
    - Sends raw bytes, you can send image (10MB)
    - Set metadata of your message
  - Use Pub/Sub for streaming resilience
    - Data is held until application is ready
- Summary
  - Latency, out-of-order, duplication will happen
  - Pub/Sub with Dataflow: Exactly once, ordered processing


## Dataflow Streaming Features

- Challenges with processing streaming data
  - scaliability: straming data generally only grows larger and more frequent
  - fault tolerance: maintain fault tolerance despite increasing volumes of data
  - model: is it streaming or repeated batch
  - timing: what if data arrives late
- 3 kinds of windows fit most circumstances
  - fixed: windowing divides data into time-based finite chunks
  - sliding: Oftern required when doing aggregations over unbounded data
  - sessions
- Custom triggers
  - AfterWatermark
  - AfterProcessingTime
  - AfterCount
