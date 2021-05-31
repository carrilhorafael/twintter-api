class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :content_text, presence: true, length: {maximum: 256}
  validate :anti_spam

  def anti_spam
    if Comment.where(content_text: content_text, user_id: user.id).length > 3
      errors.add(:spam, "Você comentou isso antes")
    end
  end


end
