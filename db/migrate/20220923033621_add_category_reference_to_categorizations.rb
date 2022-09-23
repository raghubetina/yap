class AddCategoryReferenceToCategorizations < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :categorizations, :categories
    add_index :categorizations, :category_id
    change_column_null :categorizations, :category_id, false
  end
end
