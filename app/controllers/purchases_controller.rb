class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @buyer = Buyer.new
    @item = Item.find(params[:item_id])
    if current_user.id != @item.user_id && @item.purchase.present?
      redirect_to root_path
    elsif current_user.id == @item.user_id
      redirect_to root_path
    end
  end
  
  def create
    @item = Item.find(params[:item_id])
    @buyer =  Buyer.new(buyer_params)
    if @buyer.valid? #バリデーションが通るか確認するための記述（formオブジェクトではsaveの時にバリデーションをしないため）
      pay_item
      @buyer.save
      redirect_to root_path 
    else
      render :index
    end
    
  end
  
  private

  def buyer_params
    params.require(:buyer).permit(:post_code, :prefecture_id, :municipality, :house_num, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,           # 商品の値段
      card: buyer_params[:token],    # カードトークン
      currency: 'jpy'                # 通貨の種類（日本円）
    )
  end

end
