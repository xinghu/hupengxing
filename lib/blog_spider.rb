module Spider

  require 'rubygems'
  require 'hpricot'
  require 'open-uri'

  def self.get_myblogs
    url = "http://xinghu.javaeye.com/?page=2"

    url2 = "http://xinghu.javaeye.com"
    doc = Hpricot.parse(open(url).read)

    blog_urls = []
    doc.search("//div[@class='blog_main']//h3/a").each do |x|
      blog_urls << x.attributes["href"]
    end

    p blog_urls.first
    
    blog_urls.each do |u|
      blog_doc = Hpricot.parse(open(url2 + u).read)

     title = blog_doc.at("//div[@class='blog_title']//h3/a").inner_html
     content = blog_doc.at("//div[@class='blog_content']").inner_html

      p title
      p content

      Blog.create({:title => title, :content => content})
    end
  end

end

