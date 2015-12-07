require 'open-uri'
require 'nokogiri'
require './news-site.rb'
require './news-yomiuri.rb'
require './news-nikkei.rb'

# クローリング
# # Nokogiriドキュメントクラスの作成
def get_nokogiri_doc(url)
  begin
    html = open(url)
  rescue OpenURI::HTTPError
    return
  end
  Nokogiri::HTML(html.read, nil, 'utf-8')
end

site = NewsSite.new(Nikkei.new)
url = site.url
for num in 1..3 do
  puts "------- number #{num}  -------"
  puts url
  doc = get_nokogiri_doc(url)
  titles = site.scrape(doc)
  titles.each do |key,val|
    puts key
    puts val
  end
  url = site.get_next_url(doc)
  break if url.nil?
end

puts "------ end ------"



