class CategorizationResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :place_id, :integer
  attribute :category_id, :integer

  # Direct associations

  belongs_to :category

  belongs_to :place

  # Indirect associations
end
