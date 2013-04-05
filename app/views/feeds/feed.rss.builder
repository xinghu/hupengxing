xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "hupengxing'blog-Ruby On Rails,Linux,Ubuntu,Ruby,音乐，足球，电影"
    xml.description "爱足球，爱linux，爱linux，爱ruby on rails"
    xml.link root_path

    for post in @blogs
      xml.item do
        xml.title post.title
        xml.description post.content
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link blog_path(post)
        xml.guid blog_path(post)
      end
    end
  end
end