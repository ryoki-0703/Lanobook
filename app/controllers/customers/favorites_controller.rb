class Customers::FavoritesController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    favorite = current_customer.favorites.new(book_id: book.id)
    favorite.save
    redirect_back(fallback_location: customers_book_path(book.id))
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_customer.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_back(fallback_location: customers_book_path(book.id))
  end
end
