class ApplicationController < ActionController::Base
  before_action :find_cart

  include SessionsHelper

  protect_from_forgery with: :exception

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def current_cart
    Order.find(session[:cart_id])
  rescue
    order = current_user.orders.create!
    session[:cart_id] = order.id
    order
  end

  def find_cart
    @cart = current_cart
  end

  helper_method :current_cart
end
