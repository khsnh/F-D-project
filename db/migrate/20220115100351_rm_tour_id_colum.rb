class RmTourIdColum < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_rating_products, :tour_id
  end
end
