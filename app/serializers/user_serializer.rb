class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :profile_img
  has_many :friends
end
