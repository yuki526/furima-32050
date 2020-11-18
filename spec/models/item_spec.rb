require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "すべての項目が正しく存在すれば出品できること" do
      expect(@item).to be_valid
    end

    it "商品画像が添付されていない場合出品できないこと" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名が空では出品できないこと" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it "商品の説明が空では出品できないこと" do
      @item.detail = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Detail can't be blank")
    end

    it "カテゴリの情報が選択されていないと出品できないこと" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end

    it "商品の状態についての情報が選択されていないと出品できないこと" do
      @item.item_status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Item status Select")
    end

    it "配送料の負担についての情報が選択されていないと出品できないこと" do
      @item.delivery_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee Select")
    end

    it "発送元の地域についての情報が選択されていないと出品できないこと" do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture Select")
    end

    it "発送までの日数についての情報が選択されていないと出品できないこと" do
      @item.required_day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Required day Select")
    end

    it "価格が空では出品できないこと" do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "価格が¥299以下の場合は出品できないこと" do
      @item.price = 10
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")

    end

    it "価格が¥10,000,000以上の場合は出品できないこと" do
      @item.price = 15000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it "価格が半角数字以外では出品できないこと" do
      @item.price = "５０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end





  end
end
