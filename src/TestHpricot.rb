# encoding: utf-8
require 'rubygems'
require 'hpricot'
document = <<END
<ul>
<li>first item</li>
<li>second item</li>
<div class="b">
<td class="a">third item</td>
<td sku="b">fourth item</td>
</div>
</ul>
<a target="_blank" href="http://item.jd.com/150977.html" onclick="searchlog(1,150977,0,1)" title="">
Nikon 尼康
		</a>
<div class="p-img">
		<a target="_blank" href="http://item.jd.com/150977.html" onclick="searchlog(1,150977,0,2)" title="【尼康镜头】【品质保证】【请妥善保存好发票，谨防无法保修】">
			<img width="160" height="160" data-img="1" src="http://img12.360buyimg.com/n2/3500/f6950408-8cf6-4c76-b542-b3e4a6bb54cf.jpg" class="err-product">
		</a>
		<div shop_id="0"></div>
	</div>
END
doc = Hpricot.parse(document.encode('GBK'))
(doc/'div.p-img a').each do |item|
#puts item.inner_html
    puts item.search("img").attr("src")
end

str = "尼康（<font class="skcolor_ljg">Nikon</font>） <font class="skcolor_ljg">AF-S</font> <font class="skcolor_ljg">DX</font>  <font class="skcolor_ljg">35mm</font> <font class="skcolor_ljg">f/1.8G</font> 镜头<font style="color:#ff0000;margin-left:5px;" class="adwords" id="AD_150977">【尼康镜头】【品质保证】【请妥善保存好发票，谨防无法保修】</font>"
#str.gsub!(/<>/,'')