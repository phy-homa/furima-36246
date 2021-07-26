class OrderMailing
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :tel, :order_id, :token

  validates :postal_code, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :tel, presence: true


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Mailing.create(postal_code:postal_code, prefecture_id:prefecture_id, city:city, address:address, building:building, tel:tel, order_id:order.id)
  end
end