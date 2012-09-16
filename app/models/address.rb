class Address

  include Mongoid::Document
  include Mongoid::Timestamps

  field :city, type: String
  field :country, type: String
  field :state, type: String
  field :street_address, type: String
  field :zip_code, type: String

  embedded_in :location

  def short
    "#{street_address}, #{city}"
  end

end
