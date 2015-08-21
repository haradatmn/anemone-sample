# -*- encoding: utf-8 -*-
require 'anemone'

# ページ指定クローラ
## ページを指定して深さ0で巡回するクローラ

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

Anemone.crawl(urls, opts){|anemone|
  anemone.on_every_page{|page|
    puts page.url
  }
}