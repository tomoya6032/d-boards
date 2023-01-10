class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
  
    has_many :articles, dependent: :destroy
    has_many :likes,dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_one :profile, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :chats, dependent: :destroy
    has_many :informations, dependent: :destroy
    has_one_attached :avatar, dependent: :destroy
  
    def has_written?(article)
      articles.exists?(id: article.id)
    end
  
    def has_written2?(information)
      informations.exists?(id: information.id)
    end
  
    def has_liked?(article)
      likes.exists?(article_id: article.id)
    end
  
    def has_favorited?(chat)
      favorites.exists?(chat_id: chat.id)
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
  