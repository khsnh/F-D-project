class ProductsController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.all
    @cart = current_cart
    @order_item = current_cart.order_items.new
  end

  def show
    @products = Product.all
    @product = Product.find_by(id: params[:id])
    @order_item = current_cart.order_items.new
  end
end
