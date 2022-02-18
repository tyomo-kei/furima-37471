class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string      :product_name,        null: false
      t.text        :product_description, null: false
      t.integer     :category_id,         null: false
      t.integer     :situation_id,        null: false
      t.integer     :charge_id,           null: false
      t.integer     :prefecture_id,       null: false
      t.integer     :day_ship_id,         null: false
      t.integer     :price,               null: false
      t.references  :user,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
