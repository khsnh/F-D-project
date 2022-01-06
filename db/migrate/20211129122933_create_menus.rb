class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.integer :product_id
      t.integer :category_id

      t.timestamps
    end
  end
end
