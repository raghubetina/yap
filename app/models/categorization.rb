class Categorization < ApplicationRecord
  # Direct associations

  belongs_to :category,
             counter_cache: true

  belongs_to :place,
             counter_cache: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    place.to_s
  end
end
