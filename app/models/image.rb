class Image < ApplicationRecord
#   devise :database_authenticatable, :registerable,
#          :recoverable, :rememberable, :validatable

  belongs_to :user  # 投稿者

 # 画像のタイトル
#  attr_accessor :title

 # 画像のファイル
#  attr_accessor :image

 # ユーザーID
#  attr_accessor :user_id

  has_many_attached :images  # 画像
  
#   validates :description, presence: true  # ディスクリプション必須
#   validates :tags, presence: true  # タグ必須
  def display_created_at
    I18n.l(self.created_at, format: :default)
  end

  def author_name
    user.display_name
  end

   
  
end
