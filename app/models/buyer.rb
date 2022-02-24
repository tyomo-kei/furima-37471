class Buyer
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :house_num, :building, :telephone, :purchase_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code,     format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :municipality
    validates :house_num
    validates :telephone,     format: {with: /\A\d{10,11}\z/ }
    #purchase_idは購入後取得するのでここでのバリデーションは必要ない
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality, house_num: house_num, building: building, telephone: telephone, purchase_id: purchase.id)
    
  end
end