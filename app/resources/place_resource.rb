class PlaceResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :description, :string
  attribute :image, :string
  attribute :location, :string

  # Direct associations

  has_many   :categorizations

  has_many   :reviews

  # Indirect associations

  many_to_many :categories

end
