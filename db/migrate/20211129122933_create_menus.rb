class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.string :product_id
      t.string :category_id

      t.timestamps
    end
  end
end
