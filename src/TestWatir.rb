# encoding: utf-8

=begin
require 'watir-webdriver'
b = Watir::Browser.new :chrome
b.goto ('http://www.google.com')
l = b.link :text => 'Play'
l.exists?
l.click
=end

# 文件名 tuoshui.rb
# 将天涯易读的帖子中的内容抓出来并打印
# 使用方法：
# ruby tuoshui.rb [天涯易读帖子id] > result.txt
# 如果没有在运行脚本时指定帖子id的话，默认id为40489

require "iconv"
#s = "abc中国"
#puts Iconv.conv("gbk", "utf-8", s) 
require 'watir-webdriver'


def build_url(id)
  sprintf('http://www.tianya66.com/article-a-%d-%%d.html', id)
end

#   http://www.tianya66.com/article-a-158610-1.html
#   http://bbs.byr.cn/#!article/CPP/76410
id = 158623
id = ARGV.first.nil? ? id : ARGV.first.to_i

url = build_url(id)
puts url


def page(index, url)
    sprintf(url, index)
end 

b = Watir::Browser.new :chrome
b.goto page(1, url)
page_text = b.div(:class, 'pageNum1').text
m = page_text.match(/(\d+)/)
page = m ? m[1] : 10
page = page.to_i

(1..page).each do |p|
    b.goto page(p, url)
    b.lis(:class, 'at c h2').each {|li| puts li.text.encode('gbk', 'utf-8') }
end 

b.quit
