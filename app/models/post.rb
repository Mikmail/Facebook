class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy 

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true 

  def liked_by?(user)
    likes.any? { |like| like.user == user }
  end

  def find_like(user)
    likes.find_by(user: user)
  end

  def created_time_formatted
    created_at.strftime("%b %-d, %Y - %l:%M %P")
  end
  
end
