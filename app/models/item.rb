class Item < ApplicationRecord

  with_options presence:true do |u|
    u.validates :name
    u.validates :description
    u.validates :price
  end
  with_options numericality: {other_than:1, message:"can't be blank"} do |u|
    u.validates :category_id
    u.validates :status_id
    u.validates :shipping_bearer_id
    u.validates :prefecture_id
    u.validates :delivery_days_id
  end

  belongs_to :item
  belongs_to :category

end