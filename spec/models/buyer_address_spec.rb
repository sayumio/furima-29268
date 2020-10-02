require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe '商品購入' do
    before do
      @buyer_address = FactoryBot.build(:buyer_address)
    end

    it '全ての情報が正しいフォーマットで入力されていれば購入できる' do
      expect(@buyer_address).to be_valid
    end

    it 'buildingが空でも購入できる' do
      @buyer_address.building = ""
      expect(@buyer_address).to be_valid
    end

    it '郵便番号がなければ購入できない' do
      @buyer_address.post_code = nil
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Post codeを入力してください")
    end

    it '都道府県を選択していなければ購入できない' do
      @buyer_address.prefectures_id = 1
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Prefecturesを選択してください')
    end

    it '市区町村がなければ購入できない' do
      @buyer_address.city = nil
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Cityを入力してください")
    end

    it '番地がなければ購入できない' do
      @buyer_address.block = nil
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Blockを入力してください")
    end

    it '電話番号がなければ購入できない' do
      @buyer_address.phone_num = nil
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Phone numを入力してください")
    end

    it '郵便番号にハイフンがなければ購入できない' do
      @buyer_address.post_code = '1234567'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Post codeはハイフン(-)を含んでください')
    end

    it '電話番号は１１桁以内でなければ購入できない' do
      @buyer_address.phone_num = '111111111111'
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include('Phone numは11文字以内で入力してください')
    end

    it 'トークンがなければ購入できない' do
      @buyer_address.token = nil
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Tokenを入力してください")
    end
  end
end