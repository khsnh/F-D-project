class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :comment
      t.string :name
      t.string :product
      t.integer :user
      t.integer :rate

      t.timestamps
    end
  end
end
