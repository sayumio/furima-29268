class BuyersController < ApplicationController
  before_action :set_item
  before_action :move_to_index

  def index
    @buyer = BuyerAddress.new
  end

  def create
    @buyer = BuyerAddress.new(buyer_params)
    if @buyer.valid?
      pay_item
      @buyer.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if user_signed_in? == false || current_user.id == @item.user_id || @item.buyer.present?
  end

  def buyer_params
    params.permit(:post_code, :prefectures_id, :city, :block, :building, :phone_num, :token, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end
end