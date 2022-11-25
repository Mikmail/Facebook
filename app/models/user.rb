class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  followability
  #gravtastic

  has_many :posts
  has_many :likes, dependent: :destroy

  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end
end
