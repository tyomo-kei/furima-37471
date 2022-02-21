require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do

    context '商品出品できるとき' do
      it '必須項目が記載例とおりだと登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品でないとき' do
      it '画像が空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image 画像が空です")
      end
      it '商品名が空だと登録できない' do
        @item.product_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it '商品説明が空だと登録できない' do
        @item.product_description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end
      it 'カテゴリーが---だと登録できない' do
        @item.category_id = "---"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category カテゴリーが空です")
      end
      it '商品の状態が---だと登録できない' do
        @item.situation_id = "---"
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation 商品の状態が空です")
      end
      it '送料の負担が---だと登録できない' do
        @item.charge_id = "---"
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge 配送料の負担が空です")
      end
      it '発送元地域が---だと登録できない' do
        @item.prefecture_id = "---"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture 発送元の地域が空です")
      end
      it '発送までの日数が---だと登録できない' do
        @item.day_ship_id = "---"
        @item.valid?
        expect(@item.errors.full_messages).to include("Day ship 発送日までの日数が空です")
      end
      it '価格が空だと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300未満だと登録できない' do
        @item.price = Faker::Number.between(from: 0, to:299) 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '価格が全角数字だと登録できない' do
        @item.price = "１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end

  end


end
