class AddColumProductsIdUrp < ActiveRecord::Migration[6.1]
  def change
    add_column :user_rating_products , :product_id , :integer
  end
end
