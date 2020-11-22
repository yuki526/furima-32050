class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def index
    if current_user == @item.user || @item.order
      redirect_to root_path and return
    end
    @item_order = ItemOrder.new
  end

  def create
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      item_pay  # PAY.JPの決済処理
      @item_order.save
      redirect_to root_path and return
    else
      render :index
    end
  end


  private
  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city, 
                                      :house_number, :building_name, :telephone_number
                                      ).merge(user: current_user.id, item: params[:item_id], token: params[:token])   
  end

  def item_pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
