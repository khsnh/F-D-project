class Product < ApplicationRecord
  has_many :order_items, dependent: :destroy
  before_destroy :check_if_has_order_item

  validates :name, presence: true, length: { maximum: 100 }
  validates :price, presence: true
  validates :content, presence: true, length: { maximum: 255 }

  belongs_to :category
  has_one_attached :image

  def display_image
    image.variant(resize_to_limit: [100, 100])
  end

  def show_image
    image.variant(resize_to_limit: [400, 400])
  end


  def product_image
    image.variant(resize_to_limit: [150, 150])
  end

  private
    def check_if_has_order_item
      if order_items.empty?
        return true
      else
        errors.add(:base, 'This product has a orderItem')
        return false
      end
    end
end
