class ProductsController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @product = Product.find_by(id: params[:id])
    @categories = Category.all
  end
end
