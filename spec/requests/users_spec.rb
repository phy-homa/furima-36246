require 'rails_helper'

RSpec.describe "Users", type: :request do
  before do
    @user = FactoryBot.build(:user)
  end
  #bundle exec rspec spec/requests/users_spec.rb

  describe 'トップページ' do
    context 'トップページ' do
      it 'ログアウト状態の場合には、トップページ（商品一覧ページ）のヘッダーに、「新規登録」ボタンが表示される' do
        
      end
      it 'トップページ（商品一覧ページ）ヘッダーの、「新規登録」ボタンをクリックすると、新規登録ページに遷移できる' do

      end
      it 'ログアウト状態の場合には、トップページ（商品一覧ページ）のヘッダーに、「ログイン」ボタンが表示される' do
      
      end
      it 'トップページ（商品一覧ページ）ヘッダーの、「ログイン」ボタンをクリックすると、ログインページに遷移できる' do

      end
      it 'ログイン状態の場合には、トップページ（商品一覧ページ）のヘッダーに、「ユーザーのニックネーム」が表示される' do

      end
      it 'ログイン状態の場合には、トップページ（商品一覧ページ）のヘッダーに、「ログアウト」ボタンが表示される' do

      end
      it 'トップページ（商品一覧ページ）ヘッダーの、「ログアウト」ボタンをクリックすると、ログアウトができる' do

      end
    end
  end
end
