# テーブル設計

##users
| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| emaile                | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| fullname              | string  | null: false |
| fullname_kana         | string  | null: false |
| date.of.birth         | integer | null: false |

##items
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | string     | null: false                    |
| product_description | text       | null: false                    |
| productl_category   | string     | null: false                    |
| productl_situation  | string     | null: false                    |
| shipping_chages     | string     | null: false                    |
| shipping_area       | string     | null: false                    |
| day_to_ship         | string     | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |
*imageはActiveStrageで作成

##purchases
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_information | integer    | null: false                    |
| date_of_ecpiry   | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

##addresses
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_code    | integer    | null: false                    |
| prefectures  | string     | null: false                    |
| municipality | string     | null: false                    |
| aderess      | string     | null: false                    |
| building     | string     | null: false                    |
| telephone    | integer    | null: false                    |
| purchase     | references | null: false, foreign_key: true |