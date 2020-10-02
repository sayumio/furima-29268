class BuyerAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefectures_id, :city, :block, :building, :phone_num, :item_id, :user_id, :token

  # addressのバリデーション
  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'はハイフン(-)を含んでください' }
    validates :prefectures_id, numericality: { other_than: 1, message: 'を選択してください' }
    validates :city
    validates :block
    validates :phone_num, length: { maximum: 11 }
    validates :token
  end

  def save
    buyer = Buyer.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefectures_id: prefectures_id, city: city,
                   block: block, building: building, phone_num: phone_num, buyer_id: buyer.id)
  end
end