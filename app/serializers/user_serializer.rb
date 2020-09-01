class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :profile_img
end
