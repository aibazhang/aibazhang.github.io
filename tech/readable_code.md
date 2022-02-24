# リーダブルコード 表面上の改善

---

## ２章 名前に情報を詰め込む

### 明確な単語を選ぶ

- GetPage() -> DownloadPage()
- Size() -> Height(), NumNodes(), MemoryBytes()
- Stop() -> Kill(), Resume(), Pause()

### 類語辞書[Thesaurus](https://www.thesaurus.com/)使ってもっとカラフルな名前を探す

- send -> deliver, dispatch, announce, distribute, route
- find -> search, extract, locate, recover
- start -> lanuch, create, begin, open
- make -> create, set up, build, generate, compose, add, new

### 汎用的な名前を避ける

- sum -> sum_squares
- tmp -> tmp_file
- Loop: i, j, k -> club_i, members_i, users_i (ci, mi, ui)

### 抽象的 → 具体的

- --run_locally -> --use_local_database

### 頭・尾に情報を追加

- delay -> delay_secs
- size -> size_mb
- limit -> max_kbps
- password -> plaintext_password
- comment -> unescaped_comment
- html -> html_utf8

### 長さを決める

- スコープが小さければ短い名前で ok
- 不要な単語を捨てる
  - ConvertToString() -> ToString()
  - DoServeLoop() -> ServeLoop()

---

## 3 章 誤解されない名前

- filter() -> select() & exclude()
- Clip(text, length) -> Truncate(text, max_length)
- CART_TOO_BIG_LIMIT -> MAX_ITEMS_INCART
- Bool: is, has, can, should, flag などをつける
- ユーザ期待に合わせる：getMean() -> computeMean()
  具体例
- 限界値：min* max*を使う
- 範囲：first* last*を使う
- 包括的範囲：begin*, end*を使う

---

## 4 章 美しさ

- **一貫性**は極めて大事．既存のプロジェクトについては既存のスタイルを踏襲
- 関連するコードをまとめてブロックにする

---

## 5 章 コメントすべきことを知る

### 価値のあるコメント

- 「ここのコードは〇〇という背景でこうなったのだ」という説明文
- コードの欠陥あることを認める．将来いつか直さないといけないことを TODO などの記法でコメントしとく
  - パフォーマンス
  - アルゴリズムの選定
  - ロジックがスマートでない

### 価値のないコメント

- コードからすぐにわかることを書く
- 修正可能なものを補うコメント
- コメントのためのコメント

### 具体的なやり方

- 定数にコメントをつける
  - なぜかこの値を設定したのか
- 読み手立場になって考える（自分に問いかける）
  - 読み手が驚くような動作は文章化しておく：「このコードを見てびっくりすることは何だろう？」
  - ファイルやクラスは全体像のコメントを書く：「クラスファイル間で該当のクラスはどのような役割を持っているか」
- コメントを書くときの作業手順
  - 頭の中にあるコメントをとにかく抜き出す
  - コメントを読んで改善できるポイントを見つける
  - 改善する
- コードの欠陥にコメントをつける
  - TODO: あとで手を付ける
  - FIXME: 既知の不具合があるコード
  - HACK: あんまり綺麗じゃない解決策
  - XXX: 危険！大きな問題がある

## 6 章 コメントは正確で簡潔に

- あいまいな代名詞「これ」「それ」を避ける
- 関数の動作をできるだけ正確に説明
- よく分からない引数にはインラインコメントを使用
- 情報密度の高い言葉を使う（数学，情報系の専門用語）

---

## 7 章 制御フローを読みやすくする

### if の並び順

- 左側：調査対象，変化する
- 右側：比較対象，変化しない
- 関心を引く条件や目立つ条件を先に書く

### 三項演算子

- 基本的に if~else が望ましい
- 三項演算子で簡潔になるときには使用してよい
- 行数を短くするよりも，ほかの人が理解するのにかかる時間を短くする

### do~while ループは避ける

### 関数から早く返す

- 余計な処理を防ぐ

### ネストを浅くする

- if を入れ子にしない
- スレッド，シグナル，例外，無名関数，仮想メソッドの使用割合を注意する

### 巨大な式を分割する

- 説明変数を用いて分割する

```c++
if line.split(':')[0].strip() == "root" { }

username =  line.split(':')[0].strip();
if username == "root"  {}
```

- 要約変数を用いて分割する

```c++
if (request.user.id == document.owner_id) {
  // ユーザーはこの文章を編集できる
}


if (request.user.id != document.owner_id) {
  // ユーザーはこの文章を編集できない
}


final boolean user_owns_document = (request.user.id != document.owner_id)

if(!user_owns_document) {
 // ユーザーはこの文章を編集できない
}

if(user_owns_document) {
 // ユーザーはこの文章を編集できる
}
```

---

## 9 章 変数と読みやすさ

### 制御フロー変数（下の done）を削除

```c++
boolean done = false;

while (/* condition */ && !done) {
  //　何らかの処理

  if(...) {
    done = true;
    continue;
  }
}

#-----
while(/* condition */) {
  // 何らかの処理
  if (...) {
    break;
  }
}

```

### 変数のスコープを縮める

- グローバル変数を避ける
- 「変数のことが見えるコード行数をできるだけ減らす」
- クラスのメンバ変数をローカル変数に変更する
- 一度だけ書き込む変数を使う（できるだけ）
- 変数は使用する直前に定義（早めに定義してしまうと，覚えるコストが高い）

### Python と JavaScript のネストしないスコープ

- Python や JavaScript では if for try などのブロック外から変数へアクセスできてしまう

---

## 10 章 無関係の下位問題を抽出する

### メソッドの抽出

- 巨大な関数の中から，汎用的な処理を見つけ出しメソッド化していく
  - 目的：「無関係の下位問題を積極的に見つけ抽出する」
  - ラッパー関数を用意して汚いインターフェースを覆い隠すのも方法の一つ
  - 注意：やりすぎると逆にみにくくなる

## 11 章 一度に一つのことを

- タスクをできるだけ異なる関数に分割する，少なくとも異なる領域に分割する

## 12 章 コードに思いをこめる

コードを書く前にロジックを説明する文章を考えてコードを書く

- 「簡単な言葉」で説明する
- 説明の中で使っているキーワードやフレーズに注目
- 説明をあわせてコードを書く

## 13 章 短いコードを書く

- 不要な機能をプロダクトから削除する．過剰な機能はもたせない
- 定期的にすべての API を読んで，標準ライブラリに慣れ親しんでおく

## 参照

- [リーダブルコードを読んだので、殴り書き - Qiita](https://qiita.com/Kenya/items/faec4cc374edd5ffbba6)
- [リーダブルコードまとめ - Qiita](https://qiita.com/fkrw/items/7646563a2b238fbcff9a)
