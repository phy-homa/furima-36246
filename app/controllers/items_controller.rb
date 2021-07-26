class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_find, only: [:show, :destroy, :edit, :update]
  before_action :not_item_user,  only: [:destroy, :edit, :update]
  before_action :sold_out, only: [:edit, :update]
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def edit
    
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def item_params
    
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shipping_bearer_id, :prefecture_id, :delivery_days_id, :price, :image).merge(user_id: current_user.id)
  end
  def item_find
    @item = Item.find(params[:id])
  end
  def not_item_user
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end
  def sold_out
    if @item.order.present?
      redirect_to root_path
    end
  end
end