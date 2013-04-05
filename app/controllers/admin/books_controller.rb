class Admin::BooksController < Admin::ApplicationController
  # GET /admin/books
  # GET /admin/books.xml
  def index
    @admin_books = Book.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @admin_books }
    end
  end

  # GET /admin/books/1
  # GET /admin/books/1.xml
  def show
    @admin_book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @admin_book }
    end
  end

  # GET /admin/books/new
  # GET /admin/books/new.xml
  def new
    @admin_book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @admin_book }
    end
  end

  # GET /admin/books/1/edit
  def edit
    @admin_book = Book.find(params[:id])
  end

  # POST /admin/books
  # POST /admin/books.xml
  def create
    @admin_book = Book.new(params[:book])

    respond_to do |format|
      if @admin_book.save
        $cache.set :books, Book.all

        format.html { redirect_to([:admin,@admin_book], :notice => 'Book was successfully created.') }
        format.xml  { render :xml => @admin_book, :status => :created, :location => @admin_book }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @admin_book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin/books/1
  # PUT /admin/books/1.xml
  def update
    @admin_book = Book.find(params[:id])

    respond_to do |format|
      if @admin_book.update_attributes(params[:book])
        $cache.set :books, Book.all
        
        format.html { redirect_to([:admin, @admin_book] , :notice => 'Book was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @admin_book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/books/1
  # DELETE /admin/books/1.xml
  def destroy
    @admin_book = Book.find(params[:id])
    @admin_book.destroy

    $cache.set :books, Book.all

    respond_to do |format|
      format.html { redirect_to(admin_books_url) }
      format.xml  { head :ok }
    end
  end
end
