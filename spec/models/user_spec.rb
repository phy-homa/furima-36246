require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  #bundle exec rspec spec/models/user_spec.rb

  describe 'ユーザー新規登録' do
    context 'ユーザー情報' do
      it 'すべての項目が想定通り入力されている場合登録できる' do
        expect(@user).to be_valid
      end
      it 'パスワードが英数混合で6文字以上だと登録できる' do
        @user.password = "123abc"
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
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
    context '本人情報確認' do
      it 'お名前(全角)名字が空だと登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'お名前(全角)名前が空だと登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'お名前(全角)名字は、全角でないと登録できない' do
        @user.first_name = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'お名前(全角)名字は、漢字・ひらがな・カタカナでないと登録できない' do
        @user.first_name = "ｙａｍａｄａ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'お名前(全角)名前は、全角でないと登録できない' do
        @user.last_name = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'お名前(全角)名前は、漢字・ひらがな・カタカナでないと登録できない' do
        @user.last_name = "ｔａｒｏ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it 'お名前カナ(全角)名字がないと登録できない' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'お名前カナ(全角)名前がないと登録できない' do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'お名前カナ(全角)名字は、全角でないと登録できない' do
        @user.first_name_kana = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it 'お名前カナ(全角)名字は、全角（カタカナ）でないと登録できない' do
        @user.first_name_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it 'お名前カナ(全角)名字は、全角でないと登録できない' do
        @user.last_name_kana = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it 'お名前カナ(全角)名字は、カタカナでないと登録できない' do
        @user.last_name_kana = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it '生年月日がないと登録できない' do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end