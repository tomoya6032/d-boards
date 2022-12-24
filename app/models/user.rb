class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy
  has_many :likes,dependent: :destroy
  has_many :favorite_articles, through: :likes, source: :article
  has_one :profile, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_one_attached :avatar

  def has_written?(article)
    articles.exists?(id: article.id)
  end

  def display_name
    profile&.nickname || self.email.split('@').first
  end

  def prepare_profile
    profile || build_profile
  end

  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default-avatar.png'
    end
  end
  

end
