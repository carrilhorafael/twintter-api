class Post < ApplicationRecord
  belongs_to :user

  validates :content_text, presence: true, length: {maximum: 256}
  
  
end
