class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :get_recent_posts, :ensure_domain


  $title = "hupengxing的博客"
  $keywords = 'Blog,Ruby On Rails,Linux,Ubuntu,Ruby,音乐，足球，电影, rails'
  $description = "爱足球，爱linux，爱linux，爱ruby on rails"

  
  protected
  
  def get_recent_posts
    @recent_blogs = Blog.get_cache_blogs
    @categories = Category.get_cache_categories
    @comments = Comment.get_cache_comments
    @books = Book.all
  end
  
  def ensure_domain
     if is_valid_domain?
      # HTTP 301 is a "permanent" redirect
      #redirect_to "#{request.url.gsub('hupengxing.heroku.com', 'hupengxing.com')}", :status => 301
    end
  end
  
  def is_valid_domain?
    domain = request.env['HTTP_HOST'].split(":").first
    # my_domains = %w{hupengxing.com www.hupengxing.com localhost tzz.lh} 
    # return my_domains.exclude? domain
    ::Rails.env == 'production' && domain == 'hupengxing.heroku.com'
  end
  

end
