class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new
      end
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :product_description, :category_id, :situation_id, :charge_id, :prefecture_id, :day_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
