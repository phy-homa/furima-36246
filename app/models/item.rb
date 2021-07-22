class Item < ApplicationRecord

  with_options presence:true do |u|
    u.validates :name
    u.validates :description
    u.validates :price, numericality:{ in: 300..9999999}
  end
  with_options numericality: {other_than:1, message:"can't be blank"} do |u|
    u.validates :category_id
    u.validates :status_id
    u.validates :shipping_bearer_id
    u.validates :prefecture_id
    u.validates :delivery_days_id
  end

  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_bearer
  belongs_to :Prefecture
  belongs_to :delivery_days
  has_one_attached :image

end