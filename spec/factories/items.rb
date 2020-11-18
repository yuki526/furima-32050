FactoryBot.define do
  factory :item do
    name { 'テスト商品' }
    price { 5000 }
    detail { 'これはテスト商品です。' }
    category_id { 3 }
    item_status_id { 3 }
    delivery_fee_id { 3 }
    prefecture_id { 3 }
    required_day_id { 3 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    
  end
end
