class LikePost < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validate :already_liked?

  def already_liked?
    if post.users.include?(user)
      errors.add(:already_liked, "Você já deu like nesse post")
    end
  end

end
