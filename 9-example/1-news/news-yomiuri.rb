#読売新聞
class Yomiuri
  attr_accessor :base_url
  attr_accessor :url

  def initialize()
    @base_url = "http://www.yomiuri.co.jp/latestnews/"
    @url = @base_url
  end
  #スクレイピング(データ解析)
  def scrape(doc)
     titles = {}
     x_pattern = "//div[@class='pbNested row-contents']/div/div/ul/li/a"
     doc.xpath(x_pattern).each do |element|
        #エイリアス(実文字)からCRLF（改行）、タブ、空白を削除
        title = element.text.gsub(/\r\n|\t|\s/,"")
        # href部分を抽出
        url = "#{element[:href]}"
        # タイトル、URLを配列に格納
        titles.store(title.to_s, url)
     end
     return titles
  end

  def get_next_url(doc)
    return nil
  end
end
