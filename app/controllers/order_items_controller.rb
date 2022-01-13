class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]

  # GET /order_items
  # GET /order_items.json
  def index
    @order_items = OrderItem.all
  end

  # GET /order_items/1
  # GET /order_items/1.json
  def show
  end

  # GET /order_items/new
  def new
  end

  # GET /order_items/1/edit
  def edit
  end

  # POST /order_items
  # POST /order_items.json
  def create
    ActiveRecord::Base.transaction do
      @cart = current_cart
      product = Product.find(params[:order_item][:product_id])
      @order_item = @cart.add_product(product.id, params[:order_item][:quantity])
      session[:order_id] = @order_id
      respond_to do |format|
        if @cart.save
          format.html { redirect_to('/', :notice => 'Order item was successfully created') }
          format.js { @current_item = @order_item }
          format.json { render :show, status: :created, location: @order_item }
        else
          format.html { render :new }
          format.js { @current_item = @order_item }
          format.json { render json: @order_item.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /order_items/1
  # PATCH/PUT /order_items/1.json
  def update
    @order = current_cart
    @order_item = @order.order_items.find(params[:id])
      respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to cart_path(id: @order.id), notice: 'order item was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_items }
      else
        format.html { render :edit }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_items/1
  # DELETE /order_items/1.json
  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html {redirect_to cart_path}
      format.json { head :no_content }
      flash[:success] = "Bạn đã xóa sản phẩm thành công"
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

  # Never trust parameters from the scary internet, only allow the white list through.
    def order_item_params
      params.require(:order_item).permit(:product_id, :cart_id, :quantity)
    end
end
