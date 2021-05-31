class Post < ApplicationRecord
  belongs_to :user
  has_many :like_posts
  has_many :users, through: :like_posts
  has_many :comments

  validates :content_text, presence: true, length: {maximum: 256}
  

end
