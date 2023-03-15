require 'rails_helper'

RSpec.describe Item, type: :model do

before do
  @item = FactoryBot.build(:item)
end

describe 'アイテムの保存' do
  context 'アイテムが保存できる場合' do
    it '全ての情報が存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end
  context 'アイテムが保存できない場合' do
    it 'ユーザー登録している人でないと登録できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
    it "imageが空だと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空だとアイテムは保存できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明がないとアイテムは保存できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'カテゴリーの情報がないとアイテムは保存できない' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
    end

    it 'カテゴリーの情報は0以外でないと登録できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end

    it '商品の状態の情報がないとアイテムは保存できない' do
      @item.item_status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Item status is not a number")
    end

    it '商品の状態の情報は0以外でないと登録できない' do
      @item.item_status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Item status must be other than 0")
    end

    it '配送料の負担の情報がないとアイテムは保存できない' do
      @item.shipping_cost_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost is not a number")
    end

    it '配送料の負担の情報は0以外でないと登録できない' do
      @item.shipping_cost_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost must be other than 0")
    end

    it '発送元の地域の情報がないとアイテムは保存できない' do
      @item.shipping_cost_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost is not a number")
    end

    it '発送元の地域の情報は0以外でないと登録できない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
    end

    it '発送までの日数の情報がないとアイテムは保存できない' do
      @item.delivery_date_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery date is not a number")
    end

    it '発送までの日数は0以外でないと登録できない' do
      @item.delivery_date_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery date must be other than 0")
    end

    it '価格の情報がないとアイテムは保存できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number")
    end

    it '価格が299円以下だと出品できない' do
      @item.price = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it '価格が10000000円以上だと出品できない' do
      @item.price = 10000001
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it '価格が全角文字では登録できないこと' do
      @item.price = 'てすと'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it '価格が半角英語だけでは登録できないこと' do
      @item.price = 'test'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it '価格が半角英数混合では登録できないこと' do
      @item.price = 'test123'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
   end
  end
end
