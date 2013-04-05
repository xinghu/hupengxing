class Admin::CommentsController < Admin::ApplicationController

  def index
    @comments = Comment.order("created_at desc").page params[:page]
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /blogs/1
  # GET /blogs/1.xml
  def show
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @blog = @comment.blog
    @comment.destroy

    @blog.update_attribute(:reviews_count, @blog.comments.size)

    $cache.write(:all_comments, Comment.recent_comments)

    respond_to do |format|
      format.html { redirect_to(admin_comments_path) }
      format.xml  { head :ok }
    end

  end

end
