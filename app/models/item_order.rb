class ItemOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    validates :prefecture_id, numericality: { other_than: 0, message: "Select" }
    validates :city
    validates :house_number
    validates :telephone_number, numericality: { message: "Input only number" }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, 
                    city: city, house_number: house_number, building_name: building_name, 
                    telephone_number: telephone_number, order_id: order.id)
  end

end