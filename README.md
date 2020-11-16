# README


# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
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

| Column          | Type       | Options                         |
| --------------- | ---------- | ------------------------------- |
| name            | string     | null: false                     |
| price           | string     | null: false                     |
| detail          | text       | null: false                     |
| category        | integer    | null: false                     |
| item_status     | integer    | null: false                     |
| delivery_fee    | integer    | null: false                     |
| shipping_from   | integer    | null: false                     |
| required_days   | integer    | null: false                     |
| purchase_status | integer    | null: false                     |
| user            | references | null: false,  foreign_key: true |

### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| postal_code      | string     | null: false                     |
| prefecture       | integer    | null: false                     |
| city             | string     | null: false                     |
| house_number     | integer    | null: false                     |
| building_name    | integer    | null: false                     |
| telephone_number | integer    | null: false                     |
| item             | references | null: false,  foreign_key: true |
| user             | references | null: false,  foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
