class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :charge
  belongs_to_active_hash :area
  belongs_to_active_hash :day
  belongs_to :user
  has_one_attached :image
  has_one :buyer

  with_options presence: true do
    validates :image
    validates :name      , length: { maximum: 40 }
    validates :comment   , length: { maximum: 1000 }
    validates :category_id
    validates :status_id
    validates :charges_id
    validates :area_id
    validates :days_id
    validates :price     , format: { with: /\A[0-9]+\z/ }
  end

  with_options numericality: { other_than: 1, message: '選択してください' } do
    validates :category_id
    validates :status_id
    validates :charges_id
    validates :area_id
    validates :days_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は¥300〜9,999,999で入力してください' }

end