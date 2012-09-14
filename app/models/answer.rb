class Answer

  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, type: String
  field :reputation, type: Integer

  belongs_to :noun
  belongs_to :city
  belongs_to :location
  belongs_to :user

end
