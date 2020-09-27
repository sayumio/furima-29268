class ItemsController < ApplicationController
  def index
    @items = Item.order( "created_at DESC" )
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :index
    end
  end

  private
  def item_params
    params.require(:item).permit( :name, :comment, :price, :category_id, :status_id, :charges_id, :area_id, :days_id).merge(user_id: current_user.id)
  end
end
