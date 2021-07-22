class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    unless user_signed_in?
      redirect_to root_path
    end
  end
  def create
    @item = Item.new(item_params)
    @item.save
  end

  private
  def item_params
    
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shipping_bearer_id, :prefecture_id, :delivery_days_id, :price, :image).merge(user_id: current_user.id)
    
  end
end