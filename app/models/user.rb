class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_one :buyer

  # 空白は不可
  validates :nickname, :sei, :mei, :kanasei, :kanamei, :birthday, presence: true
  # 全角ひらがな、全角カタカナ、漢字 のみ許可
  validates :sei, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角文字を使用してください' }
  validates :mei, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '全角文字を使用してください' }
  # 全角カタカナ のみ許可
  validates :kanasei, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください' }
  validates :kanamei, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください' }
  # 英数字混合 のみ許可
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '半角英数字を使用してください' }
end