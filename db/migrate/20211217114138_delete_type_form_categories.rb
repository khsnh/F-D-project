class DeleteTypeFormCategories < ActiveRecord::Migration[6.1]
  def change
    remove_column :categories, :type
  end
end