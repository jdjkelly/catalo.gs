class Answer
  include Geolib
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Max::Denormalize
  include Mongo::Voteable

  after_save :update_reputation

  field :body, type: String
  field :reputation, type: Integer, default: 0

  belongs_to :noun
  belongs_to :location
  belongs_to :user

  voteable self, up: +1, down: -1

  denormalize :location, :coordinates

  index({ location_coordinates: "2d" }, { min: -180, max: 180 })

  alias :coordinates :location_coordinates

protected

  def update_reputation
    self.set(:reputation, self.votes_point)
  end

end
