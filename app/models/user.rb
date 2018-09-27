class User
  include Mongoid::Document
  include Timestamp

  field :name, type: String
  field :email, type: String
end
