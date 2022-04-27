# GCP ではじめるデータエンジニアリング入門

## Ch.1 データ基盤の概要

- メタデータ管理の必要性
  - データは信頼できるソースから来ているのか
  - 目的に合致した正しいデータなのか
- データ基盤構築は最初からすべてのコンポーネントを用意する必要がない
- 一つのコンポーネントに対して、GCP 上では複数のプロダクトが存在

## Ch.2 BigQuery のコンセプトと利用方法

- 単なるDWHではなく、Analytics Platform as a Serviceとしても機能する
- Architecture
  - multi-tenant方式によって事前provisioningやclusterを保持するコストが発生しない
  - Task / Scheduler
    - クエリが実行までの待ち時間を最適化
  - Worker
    - 分散compute環境
    - クエリを走らせた瞬間だけ利用、終了すると廃棄
    - `BigQuery Reservations`で占有して定額利用も可能 
  - Network
    - Worker, Distributed Storage, Distributed In-memory Shuffleの膨大なデータのやり取りを支えるJupiter Network
  - Distributed Storage
    - multi-tenantでStorageを管理
    - データが簡単に共有できるため、サイロ化しない
    - ETL Pipelineの保守手間を省く
    - 自動replation
  - Distributed In-memory Shuffle
    - BQの核心
    - `GROUP BY`する際に、メッシュ状のデータ移動が発生する→Distributed In-memory Shuffle
    - 一つタスクのせいで全体が遅くなる場合の対応：投機的実行
      - worker A, worker Bを同じ処理させて、早く終わったほうを採用
      - 何らかの理由で遅くなったら、再割当てを実行

## Ch.3 データウェアハウスの構築

## Ch.4 〇〇
