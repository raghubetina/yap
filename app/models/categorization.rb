class Categorization < ApplicationRecord
  # Direct associations

  belongs_to :category,
             counter_cache: true

  belongs_to :place,
             counter_cache: true

  # Indirect associations

  # Validations

  validates :category, uniqueness: { scope: :place }

  # Scopes

  def to_s
    place.to_s
  end

  def category_name
    category.name
  end
  
end
