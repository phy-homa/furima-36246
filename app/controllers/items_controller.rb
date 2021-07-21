class ItemsController < ApplicationController

  def index
  end

  def new
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
