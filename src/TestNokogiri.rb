# encoding: utf-8
require 'rubygems'
require 'nokogiri'   
require 'open-uri'
PAGE_URL = "http://bbs.byr.cn/#!article/CPP/76377"

path = "res.html"

if FileTest::exist?(path)
	p "#{path}"+" exists"
else
	p "Nothing"
end
file = File.new("NokogiriHtml",'w')

page = Nokogiri::HTML(File.open(path))
tds=page.xpath("//class")
p tds.size
#page.encoding = "bg2312"
#p page.at_css("class").class
file.puts page
p page
file.close()
p "########################################"

doc = Nokogiri.HTML(open(PAGE_URL))
doc.encoding = "bg2312"
doc.css('a').each do |link|
  puts "#{link.content}, #{link['href']}".encode('gbk', 'utf-8')
end
#page.css('div#b-content.corner div#a-wrap.corner table.article tbody tr.abody td.a-content').each do |el| 

#p content