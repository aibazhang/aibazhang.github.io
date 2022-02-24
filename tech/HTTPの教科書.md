# HTTP の教科書

## Ch.1 The basis of HTTP and Network

## Ch.2 A simple protocol: HTTP

## Ch.3 Info of HTTP is in HTTP message

## Ch.4 HTTP status code can tell you result

### 2xx Success

- 200 OK
  - リクエストをサーバが正常に処理した
- 204 No Concent
  - 成功したが、response に entity body がなかった
  - client に対して新たな情報を送る必要がない場合に使われてる
- 206 Partial Content
  - Content-Range で指定された範囲の entity が含まれる

### 3xx Redirection

- 301 Moved Permanently
  - URI が変更された
  - 今後は新しいのを使うべき
- 302 Found
  - URI が一時的に変更された
- 303 See Other
  - ほとんど 302 と同じ
  - 処理結果を別の URI に Get Method で Redirect されたい場合
- 304 Not Modified
  - access は許可されたが、resource がなかった
  - redirect と関係ない
- 307 Temporary Redirect
  - 302 と同じ
  - POST から GET へ置き換えは行っていない

### 4xx Client Error

- 400 Bad Request
  - request の構文が間違っている
- 401 Unauthorized
  - 1 回目：HTTP 認証の認証情報が必要
  - 2 回目：認証が失敗した
- 403 Forbidden
  - Access 不可能
- 404 Not Found
  - Resource がない
  - 理由を明らかにしたくない場合にも利用する

### 5xx Server Error

- 500 Interal Server Error
  - server 側のエラー
- 503 Service Unavailable
  - 過負荷か maintaince

## Ch.5 Web servers that are linking to HTTP

### Vitual Host

- 一つの HTTP server で複数の Web site
- host 名や domain 名を完全に含んだ URI の指定か
- Host header field での指定が必ず必要になってくる

### 通信を中継する Program

- Proxy
  - Client から受け取った request を別の server に転送する
  - URI に変更などを加えず
  - 使用理由
    - network を効率よく使う
    - 組織内で特定の web サイトに対する access 制限
    - access log を取得する
  - 使用方法
    - Caching Proxy
      - 同じ request が来た場合、cach を response に
    - Transparent Proxy
      - message に何も変更を加えず
- Gateway
  - Client と gateway 間を暗号化することで、安全性を高める
  - gateway 内部は HTTP protocol 以外の通信
- Tunnel
  - 要求に応じて別の server との通信路を確立
  - SSL などによる暗号化
