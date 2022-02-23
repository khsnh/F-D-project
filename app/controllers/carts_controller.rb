class CartsController < ApplicationController
  def show
    @order_items = current_cart.order_items
    @cart = current_cart
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil

    respond_to do |format|
      format.html { redirect_to cart_path }
      format.json { head :no_content }
    end
  end

  # GET /carts
  # GET /carts.json
  def index
    @carts = []
    if session[:cart_id] != nil
      @carts << Cart.find_by_id(session[:cart_id])
    end
  end
end
