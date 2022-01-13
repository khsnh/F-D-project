class Order < ActiveRecord::Base
  before_save :update_subtotal

  enum status: [:ordering, :ordered, :confirm]

  has_many :order_items, dependent: :destroy

  def add_product(product_id, quantity)
    current_item = order_items.find_by_product_id(product_id)
    if current_item
      current_item.update!(quantity: current_item.quantity + quantity.to_i )
    else
      product = Product.find_by(id: product_id)
      current_item = order_items.build(product_id: product_id,
                                       price: product.price,
                                       quantity: quantity)
    end
    current_item
  end

  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.price) : 0 }.sum
  end

  def total_price
    order_items.to_a.sum { |item| item.total_price }
  end

  private

  def update_subtotal
    self.total_price = subtotal
  end
end
