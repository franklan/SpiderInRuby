# encoding: utf-8
require ".\\crawler"

x = Crawler.new
callback = lambda do |link|
  if(link =~/\\.(zip|rar|gz|pdf|doc)/)
    x.remember(link)
    return Crawler::PASS
  elsif(link =~/\\.(jpg|jpeg)/)
    return Crawler::DOWNLOAD
  end
  return Crawler::INDEX;
end

x.callback = callback
x.start("http://bbs.byr.cn")
