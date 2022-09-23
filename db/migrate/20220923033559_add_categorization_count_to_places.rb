class AddCategorizationCountToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :categorizations_count, :integer
  end
end
