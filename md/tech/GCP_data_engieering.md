# GCP ではじめるデータエンジニアリング入門

## Ch.1 データ基盤の概要

- メタデータ管理の必要性
  - データは信頼できるソースから来ているのか
  - 目的に合致した正しいデータなのか
- データ基盤構築は最初からすべてのコンポーネントを用意する必要がない
- 一つのコンポーネントに対して、GCP 上では複数のプロダクトが存在

## Ch.2 BigQuery のコンセプトと利用方法

- 単なる DWH ではなく、Analytics Platform as a Service としても機能する
- Architecture
  - multi-tenant 方式によって事前 provisioning や cluster を保持するコストが発生しない
  - Task / Scheduler
    - クエリが実行までの待ち時間を最適化
  - Worker
    - 分散 compute 環境
    - クエリを走らせた瞬間だけ利用、終了すると廃棄
    - `BigQuery Reservations`で占有して定額利用も可能
  - Network
    - Worker, Distributed Storage, Distributed In-memory Shuffle の膨大なデータのやり取りを支える Jupiter Network
  - Distributed Storage
    - multi-tenant で Storage を管理
    - データが簡単に共有できるため、サイロ化しない
    - ETL Pipeline の保守手間を省く
    - 自動 replation
  - Distributed In-memory Shuffle
    - BQ の核心
    - `GROUP BY`する際に、メッシュ状のデータ移動が発生する →Distributed In-memory Shuffle
    - 一つタスクのせいで全体が遅くなる場合の対応：投機的実行
      - worker A, worker B を同じ処理させて、早く終わったほうを採用
      - 何らかの理由で遅くなったら、再割当てを実行

## Ch.3 データウェアハウスの構築

- 可用性
  - 自動で複数のゾーンをまたいで replication する
  - ユーザに透過的にメンテナンス
    - ワーカーにアップデータを徐々に割り当てていく
    - ダウンタイムは発生しない
  - Disaster Recovery 計画
    - BigQuery Data Transfer Service BigQuery そのままコピー
    - Cloud Storage Transfer Service 一旦 Cloud Storage に Export してからコピー
- 用途別の影響隔離
  - slot scheduling
    - sizing はあくまで主観的に決めるもの、足りなければ動作しないものではない
    - 最適化量は BigQuery が自動的に決定し、必ずしも多ければ早くなるものではない
      - 要求と実際の割当は利用可能な最大値を従って、似たような形になる
    - query plan は実行中でも動的に変化する fair scheduling
      - 早く終わる見込みのクエリを先に終わらせる
  - on-demond vs. BigQuery Reservations
    - Depends on use case
    - on-demond
      - slot の利用上限 2000
      - プロジェクトあたり同時実行クエリ数は 100
- 目的別の影響隔離
  - staging と本番に分ける
  - staging は検証のため存在するので、低コスト運用

## Ch.4 データレイクの構築

## Ch.4 ETL/ELT 処理

- ELT を推奨する理由
  - BigQuery は scalable のため、大規模なデータの変換処理実施可能
  - SQL だけで変換処理を実施可能、別途 ETL を開発・運用する必要がない
  - overhead は発生しない、すぐに大規模並列処理として実行できる
- 外部データソースという機能があり、Cloud Storage から BigQuery へロードすることなく参照できる
- ユースケースによって
  - Dataproc を用いた ETL
  - Dataflow を用いた ETL
  - BigQuery を用いた ETL
