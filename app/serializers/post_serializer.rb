class PostSerializer < ActiveModel::Serializer
  attributes :id, :content_text
  belongs_to :user
  has_many :comments
end
