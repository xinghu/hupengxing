class FeedsController < ApplicationController
  def feed
    @blogs = Blog.order("created_at desc")

    # this will be our Feed's update timestamp

    respond_to do |format|
      format.html 

      # we want the RSS feed to redirect permanently to the ATOM feed
      format.rss { render :layout => false }
    end
  end
end
