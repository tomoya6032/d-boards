class Chat < ApplicationRecord
  has_many :replys
  belongs_to :user
  # has_many :likes, dependent: :destroy
  validates :content, presence: true
  validates :content, uniqueness: true
  validates :content, length: { maximum: 140 }, presence: true

  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

  def author_name
    user.display_name
  end

#   def like_count
#     likes.count
#   end

  # def avatar_image
  #   if profile&.avatar&.attached?
  #     profile.avatar
  #   else
  #     'default-avatar.png'
  #   end
  # end

end


