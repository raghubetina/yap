class Review < ApplicationRecord
  # Direct associations

  belongs_to :place,
             :counter_cache => true

  belongs_to :reviewer,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :rating, :presence => true

  # Scopes

  def to_s
    place.to_s
  end

end
