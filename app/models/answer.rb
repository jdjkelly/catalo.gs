class Answer

  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, type: String
  field :reputation, type: Integer

  belongs_to :noun
  belongs_to :city
  
  has_one :location

end
