class AddReviewCountToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :reviews_count, :integer
  end
end
