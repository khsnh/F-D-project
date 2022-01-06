class Product < ApplicationRecord
  has_many :order_items
  before_destroy :check_if_has_order_item

  validates :name, presence: true, length: { maximum: 100 }
  validates :price, presence: true
  validates :content, presence: true, length: { maximum: 255 }

  has_one_attached :image

  def display_image
    image.variant(resize_to_limit: [80, 80])
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
