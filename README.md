# README


# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| email                 | string | null: false |
| encrypted_password    | string | null: false |
| nickname              | string | null: false |
| first_name            | string | null: false |
| last_name             | string | null: false |
| first_name_reading    | string | null: false |
| last_name_reading     | string | null: false |
| birth_date            | date   | null: false |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| name             | string     | null: false                     |
| price            | integer    | null: false                     |
| detail           | text       | null: false                     |
| category_id      | integer    | null: false                     |
| item_status_id   | integer    | null: false                     |
| delivery_fee_id  | integer    | null: false                     |
| prefecture_id    | integer    | null: false                     |
| required_day_id  | integer    | null: false                     |
| user             | references | null: false,  foreign_key: true   |

### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| item             | references | null: false,  foreign_key: true |
| user             | references | null: false,  foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
- has_one :address


## addresses テーブル

| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| postal_code      | string     | null: false                     |
| prefecture_id    | integer    | null: false                     |
| city             | string     | null: false                     |
| house_number     | string     | null: false                     |
| building_name    | string     |                                 |
| telephone_number | string     | null: false                     |
| order            | references | null: false,  foreign_key: true |


### Association

- belongs_to :order

