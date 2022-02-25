class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :item_params, only: [:index, :create]

  def index
    @buyer = Buyer.new
    redirect_to root_path if current_user.id == @item.user_id && @item.purchase.present? 
  end
  
  def create
    item_params    @buyer =  Buyer.new(buyer_params)
    if @buyer.valid? #バリデーションが通るか確認するための記述（formオブジェクトではsaveの時にバリデーションをしないため）
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

  def item_params
    @item = Item.find(params[:item_id])
  end

end
