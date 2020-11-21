class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new
  end

  def create
    binding.pry
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      @item_order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end


  private
  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city, 
                                      :house_number, :building_name, :telephone_number
                                      ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])   
  end
end
