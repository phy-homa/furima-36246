class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence:true do |u|
    u.validates :nickname
    u.validates :birth_date
  end
  with_options presence:true, format:{ with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do |u|
    u.validates :first_name
    u.validates :last_name
  end
  with_options presence: true, format:{ with: /\A[ァ-ヶー－]+\z/ } do |u|
    u.validates :first_name_kana
    u.validates :last_name_kana
  end
  validates :password, format:{with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }

  has_many :items
  has_many :orders
end