class PurchasesController < ApplicationController

  def index
    @buyer = Buyer.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @item = Item.find(params[:item_id])
    @buyer =  Buyer.new(buyer_params)
    if @buyer.valid? #バリデーションが通るか確認するための記述（formオブジェクトではsaveの時にバリデーションをしないため）
      @buyer.save
      redirect_to root_path 
    else
      redirect_to item_purchases_path(@item.id)
    end
    
  end
  
  private

  def buyer_params
    params.require(:buyer).permit(:post_code, :prefecture_id, :municipality, :house_num, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
