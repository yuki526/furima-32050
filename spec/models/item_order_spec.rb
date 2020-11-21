require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @item_order = FactoryBot.build(:item_order)
  end

  context "商品購入ができる時" do
    it "すべての項目が正しく存在すれば購入できること" do
      expect(@item_order).to be_valid
    end

    it "建物名が空でも購入できること" do
      @item_order.building_name = nil
      expect(@item_order).to be_valid
    end
  end

  context "商品購入ができない時" do
    it "Tokenが空では購入できないこと" do
      @item_order.token = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Token can't be blank")
    end

    it "郵便番号が空では購入できないこと" do
      @item_order.postal_code = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Postal code can't be blank")
    end

    it "郵便番号はハイフン(-)が含まれた正しい形式でないと購入できないこと" do
      @item_order.postal_code = "1234567"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Postal code Input correctly")
    end

    it "都道府県についての情報が選択されていないと出品できないこと" do
      @item_order.prefecture_id = 0
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Prefecture Select")
    end

    it "市区町村が空では購入できないこと" do
      @item_order.city = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("City can't be blank")
    end

    it "番地が空では購入できないこと" do
      @item_order.house_number = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("House number can't be blank")
    end

    it "電話番号が空では購入できないこと" do
      @item_order.telephone_number = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Telephone number can't be blank")
    end

    it "電話番号はハイフン(-)を含まない正しい形式でないと購入できないこと" do
      @item_order.telephone_number = "090-1234-5678"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Telephone number Input only number")
    end

    it "電話番号は11桁以内でないと購入できないこと" do
      @item_order.telephone_number = "123456789123"
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Telephone number is too long (maximum is 11 characters)")
    end

  end
end
