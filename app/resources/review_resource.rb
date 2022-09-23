class ReviewResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :place_id, :integer
  attribute :reviewer_id, :integer
  attribute :rating, :integer

  # Direct associations

  belongs_to :reviewer,
             resource: UserResource

  # Indirect associations

end
