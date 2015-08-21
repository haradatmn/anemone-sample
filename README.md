# Anemone Sample

## クローラの構造

1. コンテンツの取得(クローリング)
2. データの解析（スクレイピング）
3. データの保存

## Anemoneの巡回メソッド

|メソッド名|機能|
|:--|:--|
|forcus_crawl(&block)|ページごとにどのリンク先を巡回するかを指定する|
|skip_links_like(*patterns)|巡回しないURLを正規表現で指定する|
|on_every_page(&block)|取得したページの全てのページを処理する|
|on_pages_like(*patterns, &block)|取得したページのうえ、正規表現で一致したページのみ処理する|

## 基本的なメイン処理の実行順序

1. 巡回対象サイトのURL指定 -> Anemone.crawl('http://xxxx')
2. 除外対象ページのURLパターン指定 -> anemone.skip_links_like
3. 巡回対象ページのURL指定 -> anemone.focus_crawl
4. 取得したページに対して、正規表現で一致したページのみを処理 -> anemone.on_pages_like
5. 取得したページ全てに対しての処理 -> anemone.on_every_page
6. ストレージに対する処理 -> anemone.after_crawl

## Anemoneオプション一覧

|メソッド名|デフォルト値|機能|
|:--|:--|
|:depeth_limit|false|サイト巡回するページの深さ指定(0:1ページのみ)falseは無制限|
|:skip_query_strings|false|URLの引数を無視するか|
|:obey_robots_txt|false|robots.txtを従うか|
|:storage|nil|どのストレージを利用するか。デフォルトはメモリ|


## Anemone::Page

|メソッド名|機能|
|:--|:--|
|content_type()|ページのコンテンツタイプ（種類）を返す|
|doc()|HTMLのbodyをNokogiri形式にして返す|
|links()|ページ中の<A>タグのリンク先の一覧をリストで返す|




