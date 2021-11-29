class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :price
      t.string :menu_id
      t.string :order_id

      t.timestamps
    end
  end
end
