class Product < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :price, presence: true
  validates :content, presence: true, length: { maximum: 255 }

  belongs_to :category
  has_one_attached :image

  def display_image
    image.variant(resize_to_limit: [80, 80])
  end

  def product_image
    image.variant(resize_to_limit: [150, 150])
  end
end
