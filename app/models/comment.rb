class Comment < ApplicationRecord
    belongs_to :article
    # belongs_to :user
    # belongs_to :profile
    # has_one_attached :avatar
    validates :content, presence: true


end
