# テーブル設計

##users
| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                | string  | null: false, unique: true |
| encrypted_password              | string  | null: false |
| last_name              | string  | null: false |
| first_name              | string  | null: false |
| last_name_kana              | string  | null: false |
| first_name_kana              | string  | null: false |
| date_of_birth         | date | null: false |
###Association
-has_many :items 
-has_many :purchases


##items
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |
| product_description | text       | null: false                    |
| category_id   | integer     | null: false                    |
| situation_id  | integer     | null: false                    |
| charges_id     | integer     | null: false                    |
| prefecture_id       | integer     | null: false                    |
| day_id         | integer     | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |
*imageはActiveStorageで作成
###Association
-belongs_to :users 
-has_one :purchases

##purchases
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_information | integer    | null: false                    |
| date_of_expiry   | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |
###Association
-belongs_to :users 
-belongs_to :items
-has_one :addresses


##addresses
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_code    | string    | null: false                    |
| prefecture_id  | integer     | null: false                    |
| municipality | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                     |
| telephone    | string    | null: false                    |
| purchase     | references | null: false, foreign_key: true |
###Association
-belongs_to :purchases