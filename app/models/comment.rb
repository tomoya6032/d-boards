class Comment < ApplicationRecord
    belongs_to :article
    # belongs_to :user
    # belongs_to :profile
    has_one_attached :avatar
    validates :content, presence: true


    # def avatar_image
    #   if profile&.avatar&.attached?
    #     profile.avatar
    #   else
    #     'default-avatar.png'
    #   end
    # end

end
