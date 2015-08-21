# -*- encoding: utf-8 -*-
require 'anemone'

# focus_crawlサンプル
## ページごとにどのリンク先を巡回するかを指定する
Anemone.crawl("http://www.amazon.co.jp/gp/bestsellers", :depth_limit => 1){|anemone|
  # ページごとにクロールするパターン指定
  anemone.focus_crawl {|page|
    # ページのAタグ一覧取得
    # 「bestsellers」にマッチしたリンクのみをArrayに詰める
    page.links.keep_if{|link|
      link.to_s.match(/\/bestsellers/)
    }
  }
  # 取得したページの全ページを処理する
  anemone.on_every_page {|page|
    puts page.url
  }
}


