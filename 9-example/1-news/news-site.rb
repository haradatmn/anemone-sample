# サイトクラス(親)
class NewsSite
  # 起点となるURL
  attr_accessor :base_url
  # ニュース記事のURL
  attr_accessor :url

  def initialize(site)
    @site = site
    @base_url = site.base_url
    @url =@base_url
    # 自分のクラスで持つメソッドと同じかチェックする
    methods.each do |method|
      if !@site.respond_to?(method.to_sym)
        raise "Site adapter must support method #{method}"
      end
    end
  end
  # スクライプ
  def scrape(doc)
    @site.scrape(doc)
  end
end
