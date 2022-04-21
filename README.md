# テーブル設計

## users テーブル

| Column              | Type      | Options                   |
| --------------------|-----------| --------------------------|
| nickname            | string    | null: false               |
| email               | string    | null: false, unique: true |
| encrypted_password  | string    | null: false               |
| last_name           | string    | null: false               |
| first_name          | string    | null: false               |
| last_name_kana      | string    | null: false               |
| first_name_kana     | string    | null: false               |
| birthday            | datetime  | null: false               |

### Association

-has_many :contents
-has_many :purchases


## contents テーブル

| Column            | Type       | Options                        |
| ------------------|------------| -------------------------------|
| title             | text       | null: false                    |
| text              | text       | null: false                    |
| detail_id         | integer    | null: false                    |
| delivery_id       | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association
-belongs_to :user
-has_one :purchase


## purchases テーブル

| Column         | Type       | Options                        |
| ---------------|------------| -------------------------------|
| user           | reference  | null: false, foreign_key: true |
| content        | reference  | null: false, foreign_key: true |


### Association
-belongs_to :user
-belongs_to :content
-has_one :shipping_address


## shipping_addresses

| Column            | Type       | Options     |
| ------------------|------------| ------------|
| shipping_address  | string     | null: false |

### Association
-belongs_to :purchase
