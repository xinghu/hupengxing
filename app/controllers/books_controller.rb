class BooksController < ApplicationController

  def show
    @book = Book.find params[:id]
    @book.update_attribute(:view_count, @book.view_count+1)
    @no_side = true
  end
end
