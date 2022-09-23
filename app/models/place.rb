class Place < ApplicationRecord
  mount_base64_uploader :image, ImageUploader

  # Direct associations

  has_many   :categorizations,
             :dependent => :destroy

  has_many   :reviews,
             :dependent => :destroy

  # Indirect associations

  has_many   :reviewers,
             :through => :reviews,
             :source => :reviewer

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
