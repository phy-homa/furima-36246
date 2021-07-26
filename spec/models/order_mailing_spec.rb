require 'rails_helper'

RSpec.describe OrderMailing, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_mailing = FactoryBot.build(:order_mailing, user_id: user.id, item_id: item.id)
    sleep(1)
  end
  #bundle exec rspec spec/models/order_mailing_spec.rb

  describe '商品購入機能' do
    context '商品購入できる時' do
      it '必要な情報がある時商品購入できる' do
        expect(@order_mailing).to be_valid
      end
      it '建物名がなくても商品購入できる' do
        @order_mailing.building = " "
        expect(@order_mailing).to be_valid
      end
    end
    context '商品購入できない時' do
      it '郵便番号がないと商品購入できない' do
        @order_mailing.postal_code = ""
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は半角でないと商品購入できない' do
        @order_mailing.postal_code = "１２３-４５６７"
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Postal code is invalid")
      end
      it '郵便番号は数字以外（文字）だと商品購入できない' do
        @order_mailing.postal_code = "ｱｲｳ-ｴｵｶｷ"
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Postal code is invalid")
      end
      it '郵便番号の最初は3桁の数字でないと商品購入できない' do
        @order_mailing.postal_code = "1234-5678"
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Postal code is invalid")
      end
      it '郵便番号はハイフンがないと商品購入ができない' do
        @order_mailing.postal_code = "1234567"
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Postal code is invalid")
      end
      it '郵便番号の最後は4桁の数字でないと商品購入できない' do
        @order_mailing.postal_code = "123-456"
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県を選択しないと商品購入できない' do
        @order_mailing.prefecture_id = 1
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村がないと商品購入できない' do
        @order_mailing.city = ""
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("City can't be blank")
      end
      it '番地がないと商品購入できない' do
        @order_mailing.address = ""
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号がないと商品購入できない' do
        @order_mailing.tel = ""
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Tel can't be blank")
      end
      it '電話番号が全角数字だと商品購入できない' do
        @order_mailing.tel = "０１２３４５６７８９"
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Tel is invalid")
      end
      it '電話番号が数字でない（文字）だと商品購入できない' do
        @order_mailing.tel = "abcdefghij"
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Tel is invalid")
      end
      it '電話番号は英数混合だと商品購入できない' do
        @order_mailing.tel = "abcde12345"
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Tel is invalid")
      end
      it '電話番号ハイフンがあると商品購入できない' do
        @order_mailing.tel = "012-345-6789"
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Tel is invalid")
      end
      it '電話番号は9桁以下だと商品購入できない' do
        @order_mailing.tel = "012345678"
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Tel is invalid")
      end
      it '電話番号は12桁以上だと商品購入できない' do
        @order_mailing.tel = "012345678901"
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Tel is invalid")
      end
      it 'token（カード情報）がないと商品購入できない' do
        @order_mailing.token = ""
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと商品購入できない' do
        @order_mailing.user_id = ""
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと商品購入できない' do
        @order_mailing.item_id = ""
        @order_mailing.valid?
        expect(@order_mailing.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
