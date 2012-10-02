class Location
  include Geolib
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  field :coordinates, :type => Array

  field :city, type: String
  field :country, type: String
  field :state, type: String
  field :street_address, type: String
  field :zip_code, type: String 

  index({ coordinates: "2d" }, { min: -180, max: 180 })

  embeds_many :location_images
  has_many :answers
  has_and_belongs_to_many :nouns

  def address
    "#{self.street_address}, #{self.city}"
  end

end
