require 'rubygems'
require 'mechanize'

a = Mechanize.new
a.get('http://item.jd.com/721132.html') do |page|
=begin
  page.links.each do |link|
    text = link.text.strip
    next unless text.length > 0
    puts text
	puts link.href
  end
=end

=begin
  page.images_with(:src => /jpg\Z/).each do |img|
    img.fetch.save
  end
=end

  p page.class

end

=begin
require 'rubygems'
require 'mechanize' 
agent = Mechanize.new
page = agent.get('http://www.jd.com/').search("p.posted")


page.links.each do |link|
	p link.text
end
=end
#agent.user_agent_alias = 'Windows IE 7'

