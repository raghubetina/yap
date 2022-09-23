class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :place_id
      t.integer :reviewer_id
      t.integer :rating

      t.timestamps
    end
  end
end
