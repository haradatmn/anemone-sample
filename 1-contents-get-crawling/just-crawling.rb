# -*- encoding: utf-8 -*-
require 'anemone'

# 巡回クローラ

# クロール対象のURL（本、Kindleストア-和書）
urls = ["http://www.amazon.co.jp/gp/bestsellers/books","http://www.amazon.co.jp/gp/bestsellers/digital-text/2275256051"]

## depeth_limit:探索する深さ、skip_query_string:同一URLの場合は、URLパラメータを無視(true)
opts = {
    :depth_limit => 1,
    :skip_query_strings => true
}
# 上記の２URLに対してクロール
Anemone.crawl(urls, opts) {|anemone|
  # ページごとにクロールするパターン指定
  anemone.focus_crawl {|page|
    # 「/gp\/bestsellers\/books」、「/gp\/bestsellers\/digital-text/」にマッチしたものを対象とする
    page.links.keep_if{|link|
      link.to_s.match(/\/gp\/bestsellers\/books|\/gp\/bestsellers\/digital-text/)
    }
  }
  # 全ページのURLを表示
  anemone.on_every_page {|page|
    puts page.url
  }
}

