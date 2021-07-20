require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    content '新規登録できる時' do
      it 'すべての項目が想定通り入力されている場合登録できる' do

      end
      it 'パスワードが6文字以上だと登録できる' do

      end
    end
    content '新規登録できない時' do
      it 'ニックネームがないと登録できない' do

      end
      it 'メールアドレスがないと登録できない' do

      end
      it '重複したメールアドレスが存在する場合は登録できない' do

      end
      it 'メールアドレスは、@を含まないと登録できない' do

      end
      it 'パスワードがないと登録できない' do

      end
      
      it 'パスワードが5文字以下だと登録できない' do

      end
      it 'パスワードは、半角英数字混合でないと入力できない' do

      end
      it 'パスワードとパスワード（確認）は、値の一致しないと登録できない' do

      end
    end
  end
end
