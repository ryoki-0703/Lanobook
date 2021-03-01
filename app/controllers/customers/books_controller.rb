class Customers::BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.customer_id = current_customer.id
    @book.save
    redirect_to customers_books_path
  end
  
  def index
    @books = Book.all
  end
  
  def show
  end
  
  def destroy
  end
end
