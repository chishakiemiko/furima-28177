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
| e_mail                | string | null: false, unique: true|
| encrypted_password    | string | null: false              |
| user_name             | string | null: false              |
| first_name            | string | null: false              |
| famiry_name           | string | null: false              |
| first_name_kana       | string | null: false              |
| famiry_name_kana      | string | null: false              |
| birth_year            | date   | null: false              |
| birth_month           | date   | null: false              |
| birth_day             | date   | null: false              |     
### Association

- has_many :items
- has_one  :orders


##  items テーブル

| Column                 | Type    | Options                      |
| -------------------    | ------  | ---------------------------- |
| information            |  text   | null: false                  |
| name                   | string  | null: false                  |
| category_id            | integer | null: false                  |
| shipping_fee_burden_id | integer | null: false                  |
| price                  | string  | null: false                  |
| shipping_area_id       | integer | null: false                  |
| day_to_ship_id         | string  | null: false                  |
| user_id                | integer | null: false,foreign_key: true|

### Association
- belongs_to :user
- has_one    :haisousaki


## haisousaki テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| postal_code         | integer    | null: false                    |
| prefectures         | string     | null: false                    |
| municipalities      | references | null: false, foreign_key: true |
| address             | string     | null: false                    |
| building_name       | string     | null: false                    |
| telephone           | integer    | null: false,unique: ture       |
| order_id            | integer    | null: false,foreign_key: true  |

### Association

- belongs_to : item
- belongs_to : order

## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_id         | integer    | null: false, foreign_key: true |                   |
| user_id         | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :haisousaki
