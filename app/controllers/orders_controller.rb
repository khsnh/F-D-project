class OrdersController < ApplicationController
  def update_status
    @order = Order.find_by(id: params[:id])
    if @order.update(status:"ordered")
      flash[:success] = "da xong"
      session.delete(:cart_id)
      redirect_to static_pages_products_path
    else
      flash[:danger] = "chua duoc"
    end
  end
end
