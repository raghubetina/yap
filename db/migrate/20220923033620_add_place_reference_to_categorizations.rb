class AddPlaceReferenceToCategorizations < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :categorizations, :places
    add_index :categorizations, :place_id
    change_column_null :categorizations, :place_id, false
  end
end
