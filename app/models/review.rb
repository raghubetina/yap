class Review < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :rating, :presence => true

  # Scopes

  def to_s
    place.to_s
  end

end
