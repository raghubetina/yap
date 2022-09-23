class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :reviews,
             foreign_key: "reviewer_id",
             dependent: :destroy

  # Indirect associations

  has_many   :reviewed_places,
             through: :reviews,
             source: :place

  # Validations

  validates :first_name, presence: true

  validates :last_name, presence: true

  # Scopes

  def to_s
    "#{first_name} #{last_name[0]}."
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
end
