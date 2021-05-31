class LikeComment < ApplicationRecord
  belongs_to :comment
  belongs_to :user

  validate :already_liked?

  def already_liked?
    if comment.users.include?(user)
      errors.add(:already_liked, "Você já deu like nesse comentário")
    end
  end
end
