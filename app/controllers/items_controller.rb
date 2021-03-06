class ItemsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update ]
before_action :set_item, only: [:show, :edit, :update ]

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
  end

  def destroy
    item = Item.find(params[:id])
    if current_user == item.user
      item.destroy
    end
    redirect_to root_path
  end

  def edit
    # 売却済商品は誰も編集ページにアクセスできない
    if @item.order
      redirect_to root_path and return
    end
    # 出品者のみ編集ページにアクセス可能
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def update
    original_image = @item.image
    if @item.update(item_params)
      if @item.image.blank?
        @item.image = original_image
      end
      redirect_to item_path(@item)
    else
      render :edit
    end


  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :detail, 
                                :category_id, :item_status_id, :delivery_fee_id, :prefecture_id, 
                                :required_day_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end
