=begin
cash = 100_00.00
sum = 0
#cast += 1.00 while cash < 1_00000.00
cast += 1.00 while cash < 1_0009.00
puts sum; 

system "echo", "Hello", "World"

puts "Hello" + "World"*3

puts "I'm running " + `ruby -v`

hi = "Hello World"
puts hi
puts "Hello #{hi}"


#ruby -e "hi=1;hi+=1 while hi<4;puts hi"

puts "Pls input something"
hi = gets
print "Hello #{hi}";



def hi
	p "Hello World"
end
hi

def hello 
	yield
end

hello {print "yield is hello world"}


class Hello
  def initialize(name)
	@name = name
  end
  
  def hello_world
	p "Hello " + @name 
  end
end

hi = Hello.new("World")
hi.hello_world
=end


# c,s=0,0;c+=1 while c<4;p c

=begin  
c = 0;
def pp
  p $c;
end
pp;
=end 


#p 3**2
=begin
value = 0
if value.zero? then
	p "false"
else
	p "true"
end

if value === [0..2]
	p "yes"
end

array = ["first","second","third"]
p array[0]
p array.inspect
arrayOfNum = [1,2,3]
p arrayOfNum[0]

hashTable = {"one" => "1", "two" => 2, "third"=>"3"}
p hashTable["two"]

def saySth(word,times)
	return word*times
end
#saySth("Hello",3);
p saySth("Hello",3)
=end

=begin
#count = Proc.new{[1,2,3,4].each do |i| p i end}
count = lambda{[1,2,3,4].each do |i| p i end}
count.call
=end

=begin
if 1<=>0
	p "false"
else
	p "true"
end

p "OK" if 1>0

array=[1,2,3,4,5]
for i in array
	p i;
end

5.upto(9) {|i| p "#{i}+a"}
=end


line = "A horse! a horse! my kingdom for a horse";
speaker = "King Richard III"
p line[7]
p line[18,10]
p line[18..27]
p line[/kingd/]
p line.index("kingd")
speaker[" III"] = ", 2007"
p speaker

p line.delete "horse"
p line.delete "horse" , "^s" 
p line.gsub "horse" , "ass"

p "0123456789".split(//)
p "0,1,2,3,4,5,6,7,8,9".split(/,/)

str="new\book\mac\111\222"
str.each_line {|item| p item}
str.lines {|item| p item}

strArray = []
"a".upto("z") {|i| strArray << i}

for i in strArray.each
	p i 
end


opening = "When in disgrace with fortune and men's eyes\nI all alone beweep my outcast state,\n"
p opening.split.grep(/men|man/)
p opening.index("men")
p opening =~ /eyes/


=begin
digits = Array(0..9)
p digits
digits << 10
p digits
digits.pop
p digits

months=["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep"]
p months.to_s
p months.join ", "
=end

=begin
file = File.open("sth.txt")
#file.each {|line| print line}
for line in file
	p line
end
file.close

ARGV << "sth.txt"

#p line while line=ARGF.gets

while line=ARGF.gets
	p line + "1"
end
=end

=begin
require 'open-uri'
#url = "http://lantianyue.com"
url = "http://www.google.com.hk/search?client=aff-cs-worldbrowser&ie=UTF-8&q=ruby"
open(url){|page| page_content = page.read()
links = page_content.scan(/href/).flatten
links.each{|link| p link}
#for link in links
#	p link
#end
}
=end

