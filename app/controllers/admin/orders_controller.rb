class Admin::OrdersController < Admin::AdminController
  before_action :set_order, only: [:show, :update_status, :edit]

  def index
    @orders = Order.not_ordering
  end

  def show
  end

  def update_status
    if @order.update(status: params[:status])
      flash[:success] = "Đã Sửa Đơn Hàng"
      session.delete(:cart_id)
      redirect_to admin_orders_path
    else
      render 'edit'
      flash[:danger] = "Chưa Nhận Đơn Hàng"
    end
  end

  def edit
  end

  private

  def set_order
    @order = Order.find_by(id: params[:id])
    redirect_to admin_orders_path unless @order
  end
end
