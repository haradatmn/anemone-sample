# -*- encoding: utf-8 -*-
require 'anemone'

# 絞り込み巡回クローラ

# 対象画面
## Kindle - コンピュータ・IT：http://www.amazon.co.jp/gp/bestsellers/digital-text/2291657051/
## Kindle - ビジネス・経済：http://www.amazon.co.jp/gp/bestsellers/digital-text/2291905051/
## 本 - コンピュータ・IT：http://www.amazon.co.jp/gp/bestsellers/books/466298/
## 本 - ビジネス・経済：http://www.amazon.co.jp/gp/bestsellers/books/466282/

urls =  [
    "http://www.amazon.co.jp/gp/bestsellers/books",
    "http://www.amazon.co.jp/gp/bestsellers/digital-text/2275256051"
]
opts = {
    :depth_limit => 1,
    :skip_query_strings => true
}
Anemone.crawl(urls, opts){|anemone|
  anemone.focus_crawl{|page|
    page.links.keep_if{|link|
      link.to_s.match(/\/gp\/bestsellers\/books|\/gp\/bestsellers\/digital-text/)
    }
  }

  PATTERN = %r[2291657051\/+|2291905051\/+|466282\/+|466298\/+]
  anemone.on_pages_like(PATTERN){|page|
    puts page.url
  }
}