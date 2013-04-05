class RootController < ApplicationController
  caches_page :index, :if => Proc.new{ ::Rails.env == 'production' }
  
  def index
    @blogs = Kaminari.paginate_array(Blog.get_cache_blogs).page(params[:page])
    @title = "hupengxing's blog"
  end
end
