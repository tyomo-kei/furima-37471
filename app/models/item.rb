class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase
  has_one_attached :image

  validates :product_name,          presence: true, length: { maximum: 40 }
  validates :product_description,   presence: true, length: { maximum: 1000 }
  validates :category_id,           numericality: { other_than: 1, message: 'カテゴリーが空です' }
  validates :situation_id,          numericality: { other_than: 1, message: '商品の状態が空です' }
  validates :charge_id,             numericality: { other_than: 1, message: '配送料の負担が空です' }
  validates :prefecture_id,         numericality: { other_than: 1, message: '発送元の地域が空です' }
  validates :day_ship_id,           numericality: { other_than: 1, message: '発送日までの日数が空です' }
  validates :price,                 presence: true,
                                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/, message: '価格は、¥300~¥9,999,999の間のみ・半角数値のみで入力' }
  validates :image,                 presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :charge
  belongs_to :day_ship
  belongs_to :prefecture
  belongs_to :situation
end
