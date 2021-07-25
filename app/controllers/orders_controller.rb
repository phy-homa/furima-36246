class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_mailing = OrderMailing.new
  end

  def create
    @order_mailing = OrderMailing.new(order_params)
    if @order_mailing.valid?
      @order_mailing.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_mailing).permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building, :tel, :order_id).merge(user_id:current_user.id, item_id: params[:item_id])
  end
end