class Product < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :price, presence: true
  validates :content, presence: true, length: { maximum: 255 }

  has_one_attached :image

  def display_image
    image.variant(resize_to_limit: [80, 80])
  end
end
