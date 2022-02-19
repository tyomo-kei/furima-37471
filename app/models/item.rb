class Item < ApplicationRecord

   belongs_to :user 
   has_one    :purchase
   has_one_attached :image

   validates :product_name,          presence: true
   validates :product_description,   presence: true
   validates :category_id,           presence: true
   validates :situation_id,          presence: true
   validates :charge_id,             presence: true
   validates :prefecture_id,         presence: true
   validates :day_ship_id,           presence: true
   validates :price,                 presence: true
   validates :user,                  presence: true, foreign_key: true


   extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to :category
   belongs_to :charge
   belongs_to :day_ship
   belongs_to :prefecture
   belongs_to :situation

   validates :category_id,   numericality: { other_than: 1 , message: "can't be blank"}
   validates :charge_id,     numericality: { other_than: 1 , message: "can't be blank"}
   validates :day_ship_id,   numericality: { other_than: 1 , message: "can't be blank"}
   validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
   validates :situation_id,  numericality: { other_than: 1 , message: "can't be blank"}


end
