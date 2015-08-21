# -*- encoding: utf-8 -*-
require 'anemone'
require 'nokogiri'
require 'kconv'

# カテゴリとサブカテゴリ取得

# 対象画面
## Kindle - コンピュータ・IT：http://www.amazon.co.jp/gp/bestsellers/digital-text/2291657051/
## Kindle - ビジネス・経済：http://www.amazon.co.jp/gp/bestsellers/digital-text/2291905051/
## 本 - コンピュータ・IT：http://www.amazon.co.jp/gp/bestsellers/books/466298/
## 本 - ビジネス・経済：http://www.amazon.co.jp/gp/bestsellers/books/466282/
urls = []
urls.push("http://www.amazon.co.jp/gp/bestsellers/digital-text/2291657051/")
urls.push("http://www.amazon.co.jp/gp/bestsellers/digital-text/2291905051/")
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/466298/")
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/466282/")
# 1階層ページ（深さ0）のみ巡回対象
opts = {:depth_limit => 0}

# カテゴリとサブカテゴリ取得
Anemone.crawl(urls, opts){|anemone|
  # 全てのページを巡回
  anemone.on_every_page{|page|
    # 文字コードをUTF8に変換したうえで、Nokogiriでパース
    doc = Nokogiri::HTML.parse(page.body.toutf8)
    # 左バーのカテゴリツリーからカテゴリーを取得
    category = doc.xpath("//*[@id='zg_browseRoot']/ul/li/a").text
    # ページヘッダー部分からサブカテゴリを取得
    sub_category = doc.xpath("//*[@id='zg_listTitle']/span").text
    puts category + "/" + sub_category
  }
}