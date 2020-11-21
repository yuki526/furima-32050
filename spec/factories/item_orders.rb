FactoryBot.define do
  factory :item_order do
    postal_code { "123-4567"}
    prefecture_id { 3 }
    city { "テスト区" }
    house_number { "テスト町１−２−３" }
    building_name { "testビル４０１" }
    telephone_number { 09012345678 }
    token { "tok_abcdefghijk00000000000000000" }
    
  end
end
