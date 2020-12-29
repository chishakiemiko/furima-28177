# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users テーブル

| Column                | Type   | Options                  |
| ------------------    | ------ | ------------------------ | 
| nickname              | string | null: false              |
| email                 | string | null: false, unique: true|
| encrypted_password    | string | null: false              |
| first_name            | string | null: false              |
| famiry_name           | string | null: false              |
| first_name_kana       | string | null: false              |
| famiry_name_kana      | string | null: false              |
| birth_date            | date   | null: false              |     
### Association

- has_many :items
- has_many :orders


##  items テーブル

| Column                 | Type    | Options                      |
| -------------------    | ------  | ---------------------------- |
| information            |  text   | null: false                  |
| name                   | string  | null: false                  |
| product_status_id      | integer | null: false                  |
| category_id            | integer | null: false                  |
| shipping_fee_burden_id | integer | null: false                  |
| price                  | integer | null: false                  |
| prefecture_id          | integer | null: false                  |
| day_to_ship_id         | integer | null: false                  |
| user_id                | integer | null: false,foreign_key: true|

### Association
- belongs_to :user
- has_one    :order


## shipping テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| municipalities      | string     | null: false                    |
| address             | string     | null: false                    |
| building_name       | string     |                                |
| telephone           | string     | null: false,unique             |
| order_id            | integer    | null: false,foreign_key: true  |

### Association

- belongs_to : order

## orders テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| item_id               | integer    | null: false, foreign_key: true |
| user_id               | integer    | null: false, foreign_key: true |



### Association

- belongs_to :user
- belongs_to :item
