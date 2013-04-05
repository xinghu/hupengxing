class BlogsController < ApplicationController
  # GET /blogs
  # GET /blogs.xml
  caches_page :show
  # GET /blogs/1
  # GET /blogs/1.xml
  def show
    @blog = Blog.find(params[:id])
    @blog_comments = @blog.comments
    @keywords = @blog.tags.to_s + ",#{$keywords}"
    @title = @blog.title + "-#{$title}"
    @description = @blog.seo_desc.to_s + ",#{$description}"
    @category = @blog.category
    
    @rand_num = create_rand_num
    session[:rand_num] = @rand_num

    @blog.update_attribute(:views_count, @blog.views_count += 1)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  # GET /blogs/new
  # GET /blogs/new.xml
  def new
    @blog = Blog.new

    @categories = Category.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])

    @categories = Category.all
  end

  # POST /blogs
  # POST /blogs.xml
  def create
    @blog = Blog.new(params[:blog])

    respond_to do |format|
      if @blog.save
        format.html { redirect_to(@blog, :notice => 'Blog was successfully created.') }
        format.xml  { render :xml => @blog, :status => :created, :location => @blog }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /blogs/1
  # PUT /blogs/1.xml
  def update
    @blog = Blog.find(params[:id])

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to(@blog, :notice => 'Blog was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.xml
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to(blogs_url) }
      format.xml  { head :ok }
    end
  end

  #评论
  def comment
    @blog = Blog.find_by_id params[:comment][:blog_id]
    @comment = Comment.new(params[:comment])
    @comment.ip = request.ip
    
    if params[:rand_num] != session[:rand_num]
      render :update do |page|
        page.alert("请输入正确的验证码")
      end and return
    end

    if @comment.valid?
      @comment.save
      @blog_comments = @blog.comments
      @blog.update_attribute(:reviews_count, @blog_comments.size)

      if @comment.parent.present?
        UserMailer.comment(@blog, @comment).deliver
      end

      render :update do |page|
        page << "$('#comment_content').val('')"
        page << "$('#comment_parent_id').val('')"
        page << "$('#rand_num').val('')"
        page.replace_html "comments", render(@blog_comments)
      end
    return
    else
      render :update do |page|
        @comment.errors.full_messages.each do |msg|
          page.alert(msg)
        end
      end
    return
    end
  end

  #创建验证码
  def create_rand_num
    str = ""
    4.times.each { str += rand(9).to_s }
    str
  end
  
end
