class Item < ApplicationRecord

  with_options presence:true do |u|
    u.validates :name
    u.validates :description
    
  end
  with_options numericality: {other_than:1, message:"can't be blank"} do |u|
    u.validates :category_id
    u.validates :status_id
    u.validates :shipping_bearer_id
    u.validates :prefecture_id
    u.validates :delivery_days_id
  end
  validates :price, presence: true, numericality:{ 
    greater_than_or_equal_to:300,
    less_than_or_equal_to:9999999},
    format: {with: /\A[0-9]+\z/i}

  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_bearer
  belongs_to :Prefecture
  belongs_to :delivery_days
  has_one_attached :image

end