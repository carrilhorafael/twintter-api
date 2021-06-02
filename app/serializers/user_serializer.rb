class UserSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :name, :gender, :email, :birthdate, :contact_phone
  has_many :posts
end
