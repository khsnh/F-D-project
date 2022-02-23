class Feedback < ApplicationRecord
  belongs_to :user

  has_one_attached :image

  def display_image
    image.variant(resize_to_limit: [80, 80])
  end
end
