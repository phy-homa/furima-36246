require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  #bundle exec rspec spec/models/user_spec.rb

  describe 'ユーザー新規登録/ユーザー情報' do
    context '新規登録できる時' do
      it 'すべての項目が想定通り入力されている場合登録できる' do
        expect(@user).to be_valid
      end
      it 'パスワードが英数混合で6文字以上だと登録できる' do
        @user.password = "123abc"
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'ニックネームがないと登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスがないと登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したメールアドレスが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'メールアドレスは、@を含まないと登録できない' do
        @user.email = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'パスワードがないと登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが5文字以下だと登録できない' do
        @user.password = "12abc"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'パスワードは、半角英数字混合でないと入力できない' do
        @user.password = "123123"
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'パスワードとパスワード（確認）は、値の一致しないと登録できない' do
        @user.password = "abc123"
        @user.password_confirmation = "def456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
