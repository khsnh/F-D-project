class Admin::ProductsController < Admin::AdminController
  before_action :find_product, only: [:edit, :update, :destroy ]

  def new
    @product = Product.new
  end

  def index
    @products = Product.paginate(page: params[:page])
  end

  def create
    @product = Product.new(product_params)
    @product.image.attach(params[:product][:image])
    if @product.save
      flash[:success] = "weo căm to product create."
      redirect_to admin_products_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
     if @product.update(product_params)
      flash[:success] = "Profile updated"
      redirect_to admin_products_path
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    flash[:success] = "Product Delete"
    redirect_to admin_products_path
  end

  private

    def find_product
      @product = Product.find_by(id: params[:id])
      redirect_to admin_products_path unless @product
    end

    def product_params
      params.require(:product).permit(:name, :price , :content, :category_id)
    end
end
