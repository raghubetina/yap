class Category < ApplicationRecord
  # Direct associations

  has_many   :categorizations,
             dependent: :destroy

  # Indirect associations

  has_many   :places,
             through: :categorizations,
             source: :place

  # Validations

  validates :name, presence: true

  # Scopes

  def to_s
    name
  end
end
