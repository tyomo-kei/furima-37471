require 'rails_helper'

RSpec.describe Buyer, type: :model do
  before do
    item   = FactoryBot.create(:item)
    user   = FactoryBot.create(:user)
    @buyer = FactoryBot.build(:buyer, item_id: item.id, user_id: user.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it 'クレジット情報、配送先、tokenが入力されていると購入できる' do
        expect(@buyer).to be_valid
      end
      it 'buildingが空欄でも購入できる' do
        @buyer.building = ''
        expect(@buyer).to be_valid
      end
      it '電話番号が10桁でも購入できる' do
        @buyer.telephone = '0123456789'
        expect(@buyer).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'tokenが空だと購入でない' do
        @buyer.token = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと購入でない' do
        @buyer.post_code = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Post code can't be blank", 'Post code is invalid')
      end
      it '郵便番号にーがないとと購入でない' do
        @buyer.post_code = '1234567'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Post code is invalid')
      end
      it '郵便番号に全角数字が含まれると購入でない' do
        @buyer.post_code = '１23４567'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Post code is invalid')
      end
      it 'prefecture_idが1だと購入でない' do
        @buyer.prefecture_id = '1'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '市町村が空だと購入でない' do
        @buyer.municipality = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空だと購入でない' do
        @buyer.house_num = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("House num can't be blank")
      end
      it '電話番号が空だと購入でない' do
        @buyer.telephone = ''
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Telephone can't be blank", 'Telephone is invalid')
      end
      it '電話番号が12桁だと購入でない' do
        @buyer.telephone = '012345678901'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Telephone is invalid')
      end
      it '電話番号が9桁だと購入でない' do
        @buyer.telephone = '012345678'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Telephone is invalid')
      end
      it '電話番号が-が含まれると購入でない' do
        @buyer.telephone = '012-3456-7890'
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Telephone is invalid')
      end
    end
  end
end
