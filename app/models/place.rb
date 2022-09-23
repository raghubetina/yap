require 'open-uri'
class Place < ApplicationRecord
  before_validation :geocode_location

  def geocode_location
    if self.location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(self.location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
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
