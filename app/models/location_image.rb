class LocationImage

  include Mongoid::Document
  include Mongoid::Timestamps

  field :path, type: String
  field :type, type: String

  embedded_in :location

  TYPES = %w(featured)
  validates_inclusion_of :type, in: TYPES

end
