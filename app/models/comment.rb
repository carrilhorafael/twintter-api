class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :replies, class_name: "Comment", foreign_key: "parent_comment_id"
  belongs_to :parent_comment, class_name: "Comment", optional: true

  validates :content_text, presence: true, length: {maximum: 256}
  validate :anti_spam

  def anti_spam
    if Comment.where(content_text: content_text, user_id: user.id).length > 3
      errors.add(:spam, "Você comentou isso antes")
    end
  end


end
