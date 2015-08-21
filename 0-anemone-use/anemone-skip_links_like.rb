# -*- encoding: utf-8 -*-
require 'anemone'

# skip_links_likeサンプル
## 巡回しないURLを正規表現で指定する
Anemone.crawl("http://www.yahoo.co.jp") { |anemone|
  # adminを含むURLは除外 ※除外設定
  anemone.skip_links_like /\/r\//
  # 取得したページの全ページを処理する
  anemone.on_every_page { |page|
    # url表示
    puts page.url
  }
}
