#日経新聞
class Nikkei
  attr_accessor :base_url
  attr_accessor :url

  def initialize()
    @base_url = "http://www.nikkei.com"
    @url = @base_url + '/news/category'
  end

  def scrape(doc)
    titles = {}
    #速報ページ※上2つは除く
    x_pattern = "//div[@class='cmn-section cmn-indent']/ul/li/h4/a"
    doc.xpath(x_pattern).each do |element|
      #puts element.text
      title = element.text.gsub(/\r\n|\t|\s/,"")
      # ドメインとページURLを分離しているため結合
      url = "#{base_url}#{element[:href]}"
      titles.store(title.to_s, url)
    end
    return titles
  end

  def get_next_url(doc)
    next_url = nil
    element = doc.xpath("//li[@class='cmnc-next']/a")
    if !element.empty?
      next_url = "#{base_url}#{element.first[:href]}"
    end
    return next_url
  end
end
