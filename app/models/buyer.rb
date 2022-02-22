class buyer
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :municipality, :address, :building, :telephone, :purchase_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code      format: {with: ^[0-9]{3}-[0-9]{4}$ }
    validates :prefecture_id  numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :telephone      format: {with: [0-9] }
    validates :purchase_id
    

  def save

  end
end