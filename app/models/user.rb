class User < ApplicationRecord
  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  devise :omniauthable, omniauth_providers: %i[facebook]
  
  followability

  has_many :posts
  has_many :comments
  has_many :likes, dependent: :destroy
  has_one :profile, dependent: :destroy

  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end

  def created_time_formatted
    created_at.strftime("%b %-d, %Y")
  end

end
