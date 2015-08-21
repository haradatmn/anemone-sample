# -*- encoding: utf-8 -*-
require 'anemone'
require 'nokogiri'
require 'kconv'

# ベストセラー情報を取得する

# Kindle - コンピュータ・IT：http://www.amazon.co.jp/gp/bestsellers/digital-text/2291657051/
# Kindle - ビジネス・経済：http://www.amazon.co.jp/gp/bestsellers/digital-text/2291905051/
# 本 - コンピュータ・IT：http://www.amazon.co.jp/gp/bestsellers/books/466298/
# 本 - ビジネス・経済：http://www.amazon.co.jp/gp/bestsellers/books/466282/
urls = []
urls.push("http://www.amazon.co.jp/gp/bestsellers/digital-text/2291657051/")
urls.push("http://www.amazon.co.jp/gp/bestsellers/digital-text/2291905051/")
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/466298/")
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/466282/")
# 1階層ページ（深さ0）のみ巡回対象
opts = {:depth_limit => 0}
# ランキング、書籍名、ASIDを取得
Anemone.crawl(urls, opts){|anemone|
  anemone.on_every_page{|page|
    # 文字コードをUTF8に変換したうえで、Nokogiriでパース
    doc = Nokogiri::HTML.parse(page.body.toutf8)
    # 有料 - タイトル・ランキング数のDIVエリア取得
    items = doc.xpath("//div[@class='zg_itemRow']/div[1]/div[2]")
    # 無料 - タイトル・ランキング数のDIVエリア取得
    items += doc.xpath("//div[@class='zg_itemRow']/div[2]/div[2]")
    # ランキング、書籍名、ASIDを取得
    items.each {|item|
      puts item.xpath("div[1]/span[@class='zg_rankNumber']").text
      puts item.xpath("div[@class='zg_title']/a").text
      puts item.xpath("div[@class='zg_title']/a").attribute("href").text.match(%r{dp/(.+?)/})[0]
    }
  }
}
