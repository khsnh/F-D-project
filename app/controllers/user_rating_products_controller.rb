class UserRatingProductsController < ApplicationController
  before_action :store_product, only: [:create, :destroy]

  def create
    @userratingproduct = current_user.user_rating_products.new(rate: params[:rate])
    @userratingproduct.product_id = @product.id
    @userratingproduct.save
    respond_to do |format|
      format.html {}
      format.js
    end
  end

  private

    def store_product
      @product = Product.find_by(id: params[:product_id])
      redirect_to products_path unless @product
    end
end
