class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :required_day

  with_options presence: true do
    validates :image
    validates :name
    validates :detail
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }, format: { with: /\A\d{3,7}\z/, message: 'Half-width number' }
    validates :category_id, numericality: { other_than: 1, message: "Select" } 
    validates :item_status_id, numericality: { other_than: 1, message: "Select" } 
    validates :delivery_fee_id, numericality: { other_than: 1, message: "Select" } 
    validates :prefecture_id, numericality: { other_than: 0, message: "Select" } 
    validates :required_day_id, numericality: { other_than: 1, message: "Select" } 
  end

end


# numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" },
# validates :price,  format: { with: /\A[0-9]+\z/, message: 'Half-width number' }
