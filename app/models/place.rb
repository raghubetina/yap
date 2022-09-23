class Place < ApplicationRecord
  # Direct associations

  has_many   :categorizations,
             :dependent => :destroy

  has_many   :reviews,
             :dependent => :destroy

  # Indirect associations

  has_many   :categories,
             :through => :categorizations,
             :source => :category

  # Validations

  validates :name, :presence => true

  # Scopes

  def to_s
    name
  end

end
