class UserSerializer < ActiveModel::Serializer
  attributes :id, :nickname, :name, :gender, :email, :birthdate, :contact_phone
  has_many :posts
  # has_and_belongs_to_many :followers, join_table: "follows", foreign_key: "followed_id", class_name: "User", association_foreign_key: "follower_id"
  # has_and_belongs_to_many :followeds, join_table: "follows", foreign_key: "follower_id", class_name: "User", association_foreign_key: "followed_id"

end
