class AddPublishedToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :published, :boolean, default: false
    add_index :categories, :title, unique: true
  end
end
