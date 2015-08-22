# -*- encoding: utf-8 -*-
require 'anemone'

# AnemoneでCocProxyを利用してキャッシュする
## $ruby proxy.rb
urls = []
urls.push("http://www.yahoo.co.jp/")

# cocproxyを起動後に設定値を指定する（以下はデフォルト）
opts = {
    :proxy_host => 'localhost',
    :proxy_port => '5432',
    :obey_robots_txt => true,
    :depth_limit => 0
}

Anemone.crawl(urls, opts){|anemone|
  anemone.on_every_page{|page|
    puts page.doc.xpath('//title/text()').to_s if page.doc
  }
}