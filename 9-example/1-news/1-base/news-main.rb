# 起動スクリプト
require 'open-uri'
require 'nokogiri'
require './news-site.rb'
require './news-yomiuri.rb'

# クローリング
# Nokogiriドキュメントクラスの作成
def get_nokogiri_doc(url)
  begin
    html = open(url)
  rescue OpenURI::HTTPError
    return
  end
  Nokogiri::HTML(html.read, nil, 'utf-8')
end

# 読売新聞のサイトクラス
site = NewsSite.new(Yomiuri.new)
# クローリング
doc = get_nokogiri_doc(site.url)
# タイトル、URL
titles = site.scrape(doc)
titles.each do |key, val|
  puts key
  puts val
end



