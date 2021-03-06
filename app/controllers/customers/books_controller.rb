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
    @books = Book.page(params[:page]).reverse_order
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to customers_book_path(book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to customers_books_path
  end

  private

  def book_params
    params.require(:book).permit(:name, :image, :introduction)
  end

end
