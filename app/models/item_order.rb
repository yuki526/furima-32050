class ItemOrder
  include ActiveModel::Model
  attr_accessor :user. :item, :order, :postal_code, :prefeture_id, :city, :house_number, :building_name, :telephone_number

  # バリデーション未設定

  def save
    order = Order.create(user: params[:user], item: params[:item])
    Address.create(postal_code: postal_code, prefeture_id: prefeture_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number, order: order)
  end
end