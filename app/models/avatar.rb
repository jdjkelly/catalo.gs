class Avatar
  include Mongoid::Document
  include Mongoid::Timestamps

  field :path, type: String

  embedded_in :user

end