class Location

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String

  embeds_one :address

  belongs_to :city
  
  has_many :answers

end
