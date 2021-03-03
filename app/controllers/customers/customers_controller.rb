class Customers::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @books = @customer.books.page(params[:page]).reverse_order
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
  end

  def customer_params
    params.require(:customer).permit(:name, :email, :encrypted_password, :password_confirmation, :image_id )
  end
end
