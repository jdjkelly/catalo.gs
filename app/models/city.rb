class City

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :latitude, type: Float
  field :longitude, type: Float

  has_many :answers
  has_many :locations
  
  has_and_belongs_to_many :nouns

end
