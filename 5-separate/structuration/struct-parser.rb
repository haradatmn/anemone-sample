require 'nokogiri'

# データ解析
def parser(file)
  doc = Nokogiri::HTML(open(file))
  puts doc.title
end

#ファイル取得
def get_file_list(target, parsed)
  puts target
  Dir::foreach(target).each{|file|
    # カレント、戻るは無視
    next if file == "." or file == ".."
    parser(target+"/"+file)
    move_file(target+"/"+file, parsed+"/"+file)
  }
end

# ファイル移動
def move_file(from, to)
  puts from
  puts to
  File.rename(from, to)
end

get_file_list("files", "parsed")
