require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  #bundle exec rspec spec/models/item_spec.rb

  describe '商品出品機能'do
    it '全て必要情報があれば登録できる' do
    end
    it '商品画像がないと登録できない' do
    end
    it '商品名がないと登録できない' do
    end
    it '商品説明がないと登録できない' do
    end
    it 'カテゴリ情報を選択しないと登録できない' do
    end
    it '商品の状態を選択しないと登録できない' do
    end
    it '送料の負担を選択しないと登録できない' do
    end
    it '発送元の地域を選択しないと登録できない' do
    end
    it '発送までの日数を選択しないと登録できない' do
    end
    it '価格は文字だと登録できない' do
    end
    it '価格の数字は半角じゃないと登録できない' do
    end
    it '価格が300円未満だと登録できない' do
    end
    it '価格が9,999,999円より高いと登録できない' do
    end
  end
end











