# AWS Cloud Practitioner

## Computing in cloud

- Amazon Elastic Computing Cloud
  - Elastic Auto Scaling
  - 注意：fluentd のようなソフトウェアを設定する場合、SSH 接続して手動でコマンドを実行するのではなく、CloudFormation などに書き込むのが一般的
  - 他のプラン
    - spot: 中断可能 90%
    - saving plans: 1,3 年、一定のコンピューティング量 72%
    - reserve instance: 1,3 年コンピューティング量制限なし
- Elastic Load Balancing
  - アプリケーションへのトラフィックを、Amazon EC2 インスタンスなどの複数のリソースに自動的に分散する AWS のサービスです。このサービスを使用すると、1 つのリソースのみが過剰に使用されないようにできます
- Amazon Simple Queue Service
- Amazon Simple Notification Service
- AWS Lambda
  - Serveless
- Amazon Elastic Container Service
- Amazon Elastic Kubernetes Service
- AWS Fargate

## AWS global infrastructure and reliability

- AWS global infrastructure
  - データガバナンスと法的要件の遵守
  - ユーザーとの近接性
  - リージョン内で利用可能なサービス
  - 料金
- Availability Zone
- Amazon CloudFront
  - グローバルなコンテンツ配信サービス
  - Origin: Amazon CloudFront でファイルを取得する時に使用するサーバ
- Edge location
  - Amazon CloudFront グローバルなコンテンツ配信サービス
  - Amazon Route 53
  - AWS Outposts AWS のインフラストラクチャとサービスをオンプレミスのデータセンターに拡張する（ハイブリッド運用）
- Provision AWS resource
  - AWS Elastic Benastalk 実行に必要なリソースが自動的にデプロイ
    - キャパシティーの調整
    - 負荷
    - 自動スケーリング
    - アプリケーションの状態モニタリング
  - AWS CloudFormation
    - Template: JSON, YAML
    - Support service: Storage, DB, Analytics, Machine Learning

## Network

- Amazon Virtual Private Cloud
- AWS Direct Connect
  - 会社のデータセンターと AWS の間で専用のプライベート接続を確立
- AWS Direct Connect
- Network Control List
  - stateless, rember nothing
  - デフォルトは全て許可する
- Sercurity Group
  - statable
  - デフォルトは全て拒否する
  - Allow all traffic out
  - Control Outbound and Inbound
- Amazon Route 53
  - AWS Domain name server
  - ユーザーからのリクエストを、AWS で実行されているインフラストラクチャ (Amazon EC2 インスタンスやロードバランサーなど) に接続
  - ユーザーを AWS 外のインフラストラクチャにルーティングすることも可能

## Storage and Database

- 一時保存：Instance Store
- Amazon Elastic Block Store
  - Amazon EC2 インスタンスで使用できるブロックレベルのストレージボリュームを提供する
  - Snapshot
- Amazon Simple Storage Service
  - How Select
    - データの取得の頻度
    - データの可用性の要件
  - S3 Standard
    - 頻繁にアクセスされるデータ用の設計
    - 最低 3 つのアベイラビリティーゾーンにデータを保存
  - S3 Standard Infrequent access
    - アクセス頻度の低いデータに最適
    - S3 標準に似ているが、ストレージ料金が低く、取り出し料金が高い
  - S3 1 Zone Infrequent access
    - 1 つのアベイラビリティーゾーンにデータを保存
    - S3 標準 – IA よりも低いストレージ料金
  - S3 Intelligent-Tiering
    - アクセスパターンが不明または変化するデータに最適
    - オブジェクトごとに月単位の少額のモニタリングおよびオートメーション料金が必要
    - 30 日間連続してアクセスがないオブジェクトは、Amazon S3 によって低頻度アクセス階層である S3 標準 – IA に自動的に移動される
  - Glacier
    - データアーカイブ用に設計された低コストのストレージ
    - 数分から数時間以内にオブジェクトを取得可能
  - S3 Glacier Deep Archive
    - 最も低コストのオブジェクトストレージクラスで、アーカイブに最適
    - 12 時間以内にオブジェクトを取得可能
- Amazon Elastic File System
  - AWS クラウドサービスとオンプレミスのリソースで使用できるスケーラブルなファイルシステム
  - Difference of EBS and EFS
    - EBS
      - 1 avaliability zone
      - in the same avalibility zone with EC2 instance
    - EFS
      - Multi-avalibaility zone
      - Using AWS Direct Connect to access EFS
- Amazon Relational Database Service
  - Amazon Aurora
  - PostgreSQL
  - MySQL
  - MariaDB
  - Oracle DB
  - Microsoft SQL Server
- Amazon Aurora
  - クラウドに特化したマネージド型リレーションナルデータベース
  - 高速化
  - 対応 DB
    - MySQL
    - PostgreSQL
- Amazon DynamoDB
  - serverless DB
  - NoSQL
  - Automatic scaling
- Redshift
  - ビッグデータ分析に使用できるデータウェアハウジングサービスです。多くのソースからデータを収集し、データ全体の関係性や傾向を理解するのに役立つ機能を提供
- Amazon Database Migration Service
- Amazon DocumentDB (with MongoDB compatibility)
  - MongoDB
- Amazon Neptune
  - Social Networking
  - Recommendation engine
  - Abnorml detection
- Amazon Managed Blockchain
- Amazon Quantum Ledger Database
  - アプリケーションデータに対して行われたすべての変更履歴を確認
- Amazon ElastiCache
  - 一般的なリクエストの読み込み時間を短縮するために、データベースの上にキャッシュレイヤーを追加するサービス
- Amazon DynamoDB Accelerator (DAX)

## Security

- Share responsibility model
  - AWS: security of the Cloud
  - You: security in the Cloud
- AWS Identity and Access Management
  - Default: don't have any permission
  - IAM group
  - Role: temporarily permission
    - サービスやリソースへのアクセス権を長期的にではなく一時的に付与する必要がある状況に適している
  - 日常のタスクにルートユーザーを使用しないようにする。その代わりに、ルートユーザーを使用して最初の IAM ユーザーを作成し、他のユーザーを作成する権限を割り当てる
- AWS Organizations
  - Manage Multipy AWS account
  - Service control policy
    - 個別のメンバーアカウント
    - 組織単位(OU)
- Compliance
  - AWS Artifact: AWS のセキュリティおよびコンプライアンスレポートのオンデマンドでの利用と、特定のオンライン契約を提供するサービス
  - AWS Artifact Agreements: AWS のサービス全体で特定の種類の情報を使用することに関して、会社が AWS との契約に署名する
  - AWS Artifact Reports: 会社の開発チームのメンバーがアプリケーションを構築しており、特定の規制基準に準拠する責任に関する詳細情報を必要
- AWS WAF / AWS Sheild
  - Filter bad actors by ML
  - AWS Shield Standard & AWS Shield Adcanced
- AWS Key Management Service
  - 暗号化キーを使用して暗号化オペレーションを実行できる
- Amazon Inspector 自動化されたセキュリティ評価を実行する
  - セキュリティの最弱性やベストプラクティスをチェック
- Amazon GuardDuty AWS インフラストラクチャとリソースのインテリジェントな脅威検出

## Monitoring

- Amazon CloudWatch
  - さまざまなメトリクスをモニタリングおよび管理し、それらのメトリクスのデータに基づいてアラームアクションを設定することができる
  - Dashboard
- AWS CloudTrail
  - 誰かが残したパンくず (またはアクションのログ) の「証跡」と考えることができる
  - AWS 環境内で発生したユーザーアクティビティと API コールの詳細を確認
  - AWS CloudTrail Insights: 異常な API アクティビティを自動的に検出できる
- AWS Trusted Advisor
  - AWS 環境を検査し、AWS のベストプラクティスに基づいてリアルタイムの推奨事項を提供する
  - 5 つのカテゴリにおいてインフラストラクチャを AWS のベストプラクティスと比較する
    - コスト最適化、パフォーマンス、セキュリティ、耐障害性、サービスの制限
  - オープンアクセスの権限をチェックして、Amazon S3 バケットのセキュリティを確認する
- AWS Config は、AWS リソースの設定を評価、監査、審査できるサービス

## Price and Support

- AWS Budgets
  - 予算を作成してサービスの使用量、サービスのコスト、インスタンスの予約を計画でる
- AWS Cost Explorer
  - 時間の経過に伴う AWS のコストと使用量を可視化して把握し、管理できるツール
- Plan
  - basic
  - developer
  - business: +AWS Trusted Advisor / Tel
  - enterprise +Technical account manager
- AWS Marketplace
  - 独立系ソフトウェアベンダーから提供される何千ものソフトウェアで構成されるデジタルカタログ

## Migration and innovation

- AWS Cloud Adoption Framework
  - Business perspective: ビジネスパースペクティブでは、IT をビジネスのニーズに合わせ、IT への投資が主なビジネスの成果に結び付く
  - Platform perspective: ビジネスの目標と観点に基づいて AWS インフラストラクチャを設計、導入、最適化する
  - Human perspective
  - Governance perspective IT 戦略をビジネス戦略に合わせるためのスキルとプロセスに重点を置き
  - Sercurity perspective
  - Operation perspective
- 6R
  - Rehosting "Lift & Shift" とも呼ばれ、変更せずにアプリケーションを移行
  - Replatforming アプリケーションの一部の側面を選択して最適化し、アプリケーションの中核となるアーキテクチャは変更せずにクラウドで利点を達成
  - Retire
  - Retain
  - Repurchase
  - Refactoring
- Snow Family
- AWS Snowcone

  - AWS Snowball Edge
    - Snowball Edge Storage Optimized 80TB
    - Snowball Edge Compute Optimized
  - AWS Snowmoblie 100PB

- Innovation

  - Amazon SageMaker 機械学習プロジェクトにすばやく簡単に取り組むことができる
  - Amazon Augmented AI
  - Amazon Lex
  - Amazon Textract
  - AWS DeepRacer 強化学習モデルをテストするために使用できる 18 分の 1 のスケールの自律走行型レースカー
  - AWS Ground Station

## AWS Well-Architected

- AWS Well-Architected Tool
  - 運用上の優秀性
  - セキュリティ
  - 信頼性
  - パフォーマンス効率
  - コスト最適化
- Benifit
