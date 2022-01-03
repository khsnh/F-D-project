class AddMoreToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users , :surname , :string
    add_column :users , :country , :string
    add_column :users , :state_region , :string
  end
end
