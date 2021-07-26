class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_find, only: [:index, :create]

  def index
    @order_mailing = OrderMailing.new
    if @item.order.present? || current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @order_mailing = OrderMailing.new(order_params)
    if @order_mailing.valid?
      pay_item
      @order_mailing.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_mailing).permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :tel, :order_id).merge(user_id:current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def item_find
    @item = Item.find(params[:item_id])
  end
end