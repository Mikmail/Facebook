class User < ApplicationRecord
  include Gravtastic
  gravtastic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  devise :omniauthable, omniauth_providers: [:facebook]

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |user|
      user.email = provider_data.info.email 
      user.password = Devise.friendly_token[0, 20]
    end
  end
  
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

  after_create :welcome_send 

  def welcome_send 
    WelcomeMailer.welcome_send(self).deliver
    redirect_to root_path, alert: "Thanks for signing up"
  end 

end
