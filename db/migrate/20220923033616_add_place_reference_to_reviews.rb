class AddPlaceReferenceToReviews < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :reviews, :places
    add_index :reviews, :place_id
    change_column_null :reviews, :place_id, false
  end
end
