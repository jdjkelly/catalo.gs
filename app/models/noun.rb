class Noun

  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String

  has_many :answers

  has_and_belongs_to_many :locations
  has_and_belongs_to_many :cities

  protected

end
