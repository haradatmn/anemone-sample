# -*- encoding: utf-8 -*-
require 'anemone'

urls = []
urls.push("http://www.yahoo.co.jp")

opts = {
    :storage => Anemone::Storage::SQLite3("sample.db"),
    :obey_robots_txt => true,
    :depth_limit => 0
}

Anemone.crawl(urls, opts){|anemone|
  anemone.on_every_page{|page|
    puts page.doc.xpath("//title/text()").to_s if page.doc
  }
}