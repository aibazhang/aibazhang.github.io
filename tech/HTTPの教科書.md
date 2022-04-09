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
- 429 Too Many Requests

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

## Ch.6 HTTP header

- HTTP message header
  - Request
    - Message Header
      - Request line
      - Request header field
      - Genral header field
      - Entity header field
    - Message Body
  - Response
    - Message Header
      - Status line
      - Response header field
      - Genral header field
      - Entity header field
    - Message Body
- Genral header field
  - Cache-Control
  - Connection
  - Date
  - Transfer-Encoding
  - Update
  - Via
    - Proxy 経由する場合に必ず追加する必要がある
  - Warning
- Request header field
  - Accpet
    - user agent が処理できる media type
    - 品質係数`q`で優先度をつける
  - Accept-Charset
  - Accept-Encoding
  - Accept-Language
  - Authorization
  - Except
  - From
  - Host
  - If-match
  - If-Modified-Since
  - If-None-Match
  - If-Range
  - If-Unmodified-Since
  - Max-Forwards
  - Proxy-Authorization
  - Range
  - Referer
  - TE
  - User-Agert
    - Robot agent をから request する場合、e-mail を追加する場合がある
- Response header field
  - Accept-Ranges
  - Age
  - ETag
    - ルールは特に決まっておらず、サーバによって割り当てる
    - 強い ETag: わずかに違っても必ず値が変化する
    - 弱い ETag: 意味上異なったリソースとして差異がある場合のみ
  - Location
  - Proxy-Authenticate
    - Proxy server からの認証要求を client に伝える
  - Retry-After
  - Server
    - `Server: Apache/2.2.17 (Unix)`
  - Vary
  - WWW-Authenticate
- Entity header field
  - Allow
  - Content-Encoding
  - Content-Language
  - Content-Length
  - Content-Location
  - Content-MD5
  - Content-Range
  - Content-Type
    - `application/json`
  - Expires
  - Last-Modified
- Header field for Cookie
  - Request: Set-Cookie
    - NAME
    - expires
    - path
    - domain
    - Secure
    - HttpOnly
  - Response: Cookie

## Ch.7 HTTPS

- HTTP の弱点
  - 通信が平文なので盗聴可能
    - 通信の暗号化: + SSL(Secure Socket Layer), TLS(Transport Layer Security) 暗号化可能
    - contents の暗号化: Web service によく用いられる
  - 通信相手を確かめないので、なりすまし可能
    - SSL 証明書によって相手を確かめる
  - 完全性を証明できないので、改ざん可能
    - hash を確かめる: MD5, SHA-1
    - file の digital 署名を確認
- HTTPS = HTTP + 通信の暗号化 + 証明書 + 完全性保護
  - SSL の殻をかぶった HTTP
  - 公開鍵暗号方式
    - 暗号化: 公開鍵
    - 復号: 秘密鍵
    - 公開鍵が本物となっているかを証明: Certificate Authority
  - HTTPS の仕組み
    - Server からもらった Certificate messages に公開鍵証明書が含まれる
    - 復号できるかの negotiation
    - MAC(Message Authentication Code)で改ざんを検知
  - SSL は遅い？
    - 通信が遅くなる
    - SSL は暗号化処理で計算コスト

## Ch.8 Auth

- BASIC
  - 付加情報がなくても decode 可能
  - ほぼ使われていない
- DIGEST
  - Server からもらった Challenge code で response code を計算する
  - ほぼ使われていない
- SSL Client
  - Client 証明書を検証する
  - 認証局を立ち上がるためコストがかかる
- Form-base
  - 手法
    - user に session id を発行し、認証状態を記録する
    - cookie などで token を user に送る
    - session id を検証することで先のユーザかを判断
  - ほとんどの web service に使われている
  - 認証方法はさまざま

## Ch.9 HTTP に機能を追加する

- HTTP 1.1 の bottle neck
  - 1 connection 1 request
  - request can only be from client
  - compression
  - huge header low efficiency
- Ajax (Asynchronous JavaScript + XML)
  - JS 内部から HTTP 通信を行う
  - web ページの一部分だけを更新する
- Coment
  - connection の継続時間を長くする
  - server 側に contents の更新があった時に response を返す
- SPDY (SPeeDY)
  - TCP(SSL)と HTTP の間に session layer を追加
  - 単一の TCP で複数の HTTP request を無制限に処理
  - Request priority
  - Header compression
  - Server push
  - Server hint
    - request すべき resource を提案
- WebSocket protocol
  - Server と client の接続が一度確立した後、WebSocket を利用する
  - Server push
  - 通信量の削減
- HTTP 2.0

## Ch.11 Web への攻撃技術

- 攻撃 pattern
  - Active attack
    - 攻撃 code を送る
    - SQL injection / OS injection
  - Passive attack
    - 罠に user を誘導
    - user の browser に仕掛けられた攻撃 code を含んだ HTTP request を送信
- 出力値の escape の不備による脆弱性
  - Cross-site scirpting: XSS
  - SQL injection
  - OS command injection
  - HTTP header injection
  - Mail header injection
- 設定や設計による脆弱性
  - Forced Browsing
    - 公開する予定のない page が URL から閲覧可能になる
  - Error Handling Vulnerability
    - Error Handling から情報を漏洩
    - 攻撃者に hint を与えてしまう
  - Open redirect
    - 悪意のある URL に redirect される
- session 管理の不備による脆弱性
  - Session hijack
    - 攻撃者が session id を入手
    - なりすます攻撃
  - Corss-site request forgeries
- その他
  - password cracking
