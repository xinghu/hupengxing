class CategoriesController < ApplicationController

  caches_page :show

  def show
    @category = Category.find params[:id]
    @blogs = @category.blogs.order("created_at desc").page params[:page]

    render '/root/index'
  end

end
