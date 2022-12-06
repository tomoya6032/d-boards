class Article < ApplicationRecord
    has_one_attached :eyecatch

    validates :title, presence: true
    validates :title, length: { minimum: 2, maximum: 100  }
    validates :title, format: { with: /\A(?!\@)/ }

    validates :content, presence: true
    validates :content, length: { minimum: 10 }
    validates :content, uniqueness: true

    validate :validate_title_and_content_length

    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
    belongs_to :user

    
end
