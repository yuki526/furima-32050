class ItemOrder
  include ActiveModel::Model
  attr_accessor :user. :item, :order, :postal_code, :prefeture_id, :city, :house_number, :building_name, :telephone_number
end