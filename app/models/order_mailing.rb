class OrderMailing
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :tel, :token

  with_options presence:true do |u|
    u.validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    u.validates :city
    u.validates :address
    u.validates :tel,format: { with: /\A[0-9]{10,11}\z/}
    u.validates :token
    u.validates :user_id
    u.validates :item_id
  end
  validates :prefecture_id, numericality: {other_than:1, message:"can't be blank"}


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Mailing.create(postal_code:postal_code, prefecture_id:prefecture_id, city:city, address:address, building:building, tel:tel, order_id:order.id)
  end
end