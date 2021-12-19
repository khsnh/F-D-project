class AddContenToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products , :content , :string
  end
end
