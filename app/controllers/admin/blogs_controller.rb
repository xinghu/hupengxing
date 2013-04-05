class Admin::BlogsController < Admin::ApplicationController
 
  def index
    @blogs = Blog.order("created_at desc").page params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @blogs }
    end
  end

  # GET /admin/blogs/1
  # GET /admin/blogs/1.xml
  def show
    @blog = Blog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  # GET /admin/blogs/new
  # GET /admin/blogs/new.xml
  def new
    @blog = Blog.new
    @categories = Category.all
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @blog }
    end
  end

  # GET /admin/blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])
    @categories = Category.all
  end

  # POST /admin/blogs
  # POST /admin/blogs.xml
  def create
    @blog = Blog.new(params[:blog])
    @categories = Category.all
    
    expire_page '/index'
    expire_page "/categories/#{@blog.category_id}" if @blog.category
    respond_to do |format|
      if @blog.save
        $cache.write :all_blogs, Blog.recent_blogs
        
        format.html { redirect_to([:admin, @blog], :notice => 'Blog was successfully created.') }
        format.xml  { render :xml => @blog, :status => :created, :location => @blog }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/blogs/1
  # PUT /admin/blogs/1.xml
  def update
    @blog = Blog.find(params[:id])

    expire_page '/index'
    expire_page "/blogs/#{@blog.id}"
    expire_page "/categories/#{@blog.category.id}" if @blog.category

    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        $cache.write :all_blogs, Blog.recent_blogs

        format.html { redirect_to([:admin, @blog], :notice => 'Blog was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/blogs/1
  # DELETE /admin/blogs/1.xml
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    expire_page '/index'
    expire_page "/blogs/#{@blog.id}"
    expire_page "/categories/#{@blog.category.id}" if @blog.category

    $cache.write :all_blogs, Blog.recent_blogs
    
    respond_to do |format|
      format.html { redirect_to(admin_blogs_url) }
      format.xml  { head :ok }
    end
  end
end
