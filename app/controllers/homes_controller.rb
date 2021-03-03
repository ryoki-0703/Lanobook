class HomesController < ApplicationController
  def top
    @books = Book.page(params[:page]).reverse_order
  end
end
