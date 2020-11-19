class ItemsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end


  private
  def item_params
    params.require(:item).permit(:name, :price, :detail, 
                                :category_id, :item_status_id, :delivery_fee_id, :prefecture_id, 
                                :required_day_id, :image).merge(user_id: current_user.id)
  end
  
end
