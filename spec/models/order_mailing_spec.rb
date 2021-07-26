require 'rails_helper'

RSpec.describe OrderMailing, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_mailing = FactoryBot.build(:order_mailing, user_id: user.id, item_id: item.id)
  end
  #bundle exec rspec spec/models/order_mailing_spec.rb

  describe '商品購入機能' do
    context '購入できる時' do
      it '必要な情報がある時購入できる' do
        expect(@order_mailing).to be_valid
      end

    end
    context '購入できない時' do

    end
  end
end
