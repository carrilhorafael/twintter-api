class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content_text
  belongs_to :post
end
