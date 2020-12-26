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

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| nickname  | string | null: false |
| e-mail    | string | null: false |
| password  | string | null: false |
| user_name | string | null: false |

### Association

- has_many :items
- has_many :credit_card


##  items テーブル

| Column              | Type    | Options     |
| ------------------- | ------  | ----------- |
| items_image         |  text   | null: false |
| items_name          | string  | null: false |
| items_information   | string  | null: false |
| items_categoly      | string  | null: false |
| items_deriveryprise | string  | null: false |
| items_prise         | integer | null: false |
|

### Association
- belongs_to :users
- has_one    :haisousaki


## haisousaki テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| haisousaki_adress   | string     | null: false                    |
| haisou_tel          | string     | null: false                    |
| users_id            | references | null: false, foreign_key: true |

### Association

- has_one  : items

## credit_card テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_number     |  integer   | null: false                    |
| kigen           |  date      | null: false                    |
| security_code   |  integer   | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :users
