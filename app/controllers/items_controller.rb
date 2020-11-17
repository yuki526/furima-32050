class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new

  end

  def create
    @item = Item.new(item_params)

  end


  private
  def item_params
    params.require(:item).permit(:name, :price, :detail, :category_id, :item_status_id, :delivery_fee_id, :prefecture_id, :required_day_id).merge(user: current_user_id)
  end
  
end
