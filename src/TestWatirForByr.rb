if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end
require 'watir-webdriver'
require 'hpricot'

#   http://www.tianya66.com/article-a-158610-1.html
#   http://bbs.byr.cn/#!article/CPP/76410

url = "http://search.dangdang.com/?key=nikon%20af-s%20dx%2035mm%20f/1.8g"
b = Watir::Browser.new :chrome
b.goto url
#p b.html.encode('gbk', 'utf-8')
s = b.html.encode('utf-8')

file = File.new("res.html","w")
file.puts s
file.puts "####################################################################"

#JD             http://search.jd.com/Search?keyword=nikon%20af-s%20dx%2035mm%20f%2F1.8g&enc=utf-8
#dangdang       http://search.dangdang.com/?key=nikon%20af-s%20dx%2035mm%20f/1.8g
#amazon         http://www.amazon.cn/s/ref=nb_sb_noss?__mk_zh_CN=%E4%BA%9A%E9%A9%AC%E9%80%8A%E7%BD%91%E7%AB%99&url=search-alias%3Daps&field-keywords=nikon%2Baf-s%2Bdx%2B35mm%2Bf%2F1.8g
doc = Hpricot.parse(s)

#url = (doc/'div.book_shoplist ul.list_aa bigimg li.line1')
url = (doc/'div.book_shoplist')
p url.any?

=begin
url = (doc/'div.lh-wrap div.p-name')[0].search("a").attr("href")
p url
img = (doc/'div.lh-wrap div.p-img a')[0].search("img").attr("src")
p img
price = (doc/'div.lh-wrap div.p-price strong')[0].inner_html
file.puts price
p price
title = (doc/'div.lh-wrap div.p-name a')[0].inner_html
#title = title.gsub!(/(*)/,'')
file.puts title
p title
=end

=begin
file.puts item.search("a")[0]
title = item/"a"
#file.puts title[0].text
file.puts title.text
file.puts "####################################################################"
1000.times do |i|
    if title.text[i] == '\n'
        break
    else
        file.puts title.text[i]
    end
end
=end

file.close()