class AddCategorizationCountToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :categorizations_count, :integer
  end
end
