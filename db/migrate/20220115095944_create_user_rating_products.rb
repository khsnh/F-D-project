class CreateUserRatingProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :user_rating_products do |t|
      t.integer :user_id
      t.integer :rate

      t.timestamps
    end
  end
end
