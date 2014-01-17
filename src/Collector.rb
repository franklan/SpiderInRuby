# encoding: utf-8
if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end
require 'watir-webdriver'
require 'hpricot'

siteList = Array["item.jd.com","www.amazon.cn","dangdang.com"]

#src  nikon af-s dx 35mm f/1.8g
dst = "http://www.google.com.hk/webhp?hl=zh-CN#hl=zh-CN&newwindow=1&q=nikon+af-s+dx+35mm+f%2F1.8g+site:item.jd.com&safe=strict"
url = "http://bbs.byr.cn/#!article/CPP/76377"

#str = ARGV[0]
#str = str.dup.force_encoding(Encoding::UTF_8).force_encoding('ASCII-8BIT')
#p URI::encode(str)

srcQuery = "nikon af-s dx 35mm f/1.8g"

class Web
    def initialize(query)
        @query = query
    end
    def toUrl
        p "Default toUrl"
    end
    def collectData
        p "Default collectData"
    end
end
#res = toUrl("http://search.jd.com/Search?keyword=")
class JD < Web    
    def toUrl
        resUrl = @query
        resUrl.gsub! '/','%2F'
        resUrl.gsub! ' ','%20'
        resUrl = "http://search.jd.com/Search?keyword=" + resUrl
    end
    def collectData
        file = File.new("output",'w')
        file.puts "JD"
        b = Watir::Browser.new :chrome
        b.goto toUrl
        s = b.html.encode('utf-8')
        doc = Hpricot.parse(s)
        url = (doc/'div.lh-wrap div.p-name')[0].search("a").attr("href")
        file.puts url
        img = (doc/'div.lh-wrap div.p-img a')[0].search("img").attr("src")
        file.puts img
        price = (doc/'div.lh-wrap div.p-price strong')[0].inner_html
        file.puts price
    end    
end

class Dangdang < Web
    def toUrl
        #http://search.dangdang.com/?key=nikon%20af-s%20dx%2035mm%20f/1.8g
        resUrl = @query
        resUrl.gsub! ' ','%20'
        resUrl = "http://search.dangdang.com/?key=" + resUrl
    end
    def collectData
        file = File.new("output",'w')
        file.puts "JD"
        b = Watir::Browser.new :chrome
        b.goto toUrl
        s = b.html.encode('utf-8')
        doc = Hpricot.parse(s)
        url = (doc/'div.lh-wrap div.p-name')[0].search("a").attr("href")
        file.puts url
        img = (doc/'div.lh-wrap div.p-img a')[0].search("img").attr("src")
        file.puts img
        price = (doc/'div.lh-wrap div.p-price strong')[0].inner_html
        file.puts price
    end
end

class Amazon < Web
    #http://www.amazon.cn/s/ref=nb_sb_noss?__mk_zh_CN=%E4%BA%9A%E9%A9%AC%E9%80%8A%E7%BD%91%E7%AB%99&url=search-alias%3Daps&field-keywords=nikon%20af-s%20dx%2035mm%20f%2F1.8g
    def toUrl
        resUrl = @query
        resUrl.gsub! '/','%2F'
        resUrl.gsub! ' ','%20'
        resUrl = "http://www.amazon.cn/s/ref=nb_sb_noss?__mk_zh_CN=%E4%BA%9A%E9%A9%AC%E9%80%8A%E7%BD%91%E7%AB%99&url=search-alias%3Daps&field-keywords=" + resUrl
    end
end

jd = JD.new(srcQuery)
p jd.collectData
dangdang = Dangdang.new(srcQuery)
p dangdang.toUrl
amazon = Amazon.new(srcQuery)
p amazon.toUrl
#p amazon.collectData

=begin
def wordToUrl(query,site)
    resUrl = ""
    query.split.each do |item|
        resUrl = resUrl + "+" + item
    end
    resUrl.gsub! '/','%2F'
    resUrl = "http://www.google.com.hk/webhp?hl=zh-CN#hl=zh-CN&newwindow=1&q=" + resUrl[1..-1] + "+site:" + site + "&safe=strict"
end

#p wordToUrl(srcQuery,"item.jd.com")

def firstLink(gUrl)
    file = File.new("res.html","w")
    if gUrl.empty?
        p "gUrl is empty!"
    else
        b = Watir::Browser.new :chrome
        b.goto gUrl
        s = b.html.encode('utf-8')
        file.puts s
        doc = Hpricot.parse(s)
        (doc/'li.g').each do |item|
            p item
        end
    end
    file.close()
end

firstLink(dst)

def collectInfo(itemUrl)

end

def finalHtml

end
=end
#TODO