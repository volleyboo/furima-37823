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
| birthday            | date      | null: false               |

### Association

-has_many :contents
-has_many :purchases


## contents テーブル

| Column            | Type       | Options                        |
| ------------------|------------| -------------------------------|
| title             | string     | null: false                    |
| explanation       | text       | null: false                    |
| category_id       | integer    | null: false                    |
| state_id          | integer    | null: false                    |
| charge_id         | integer    | null: false                    |
| area_id           | integer    | null: false                    |
| days_id           | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association
-belongs_to :user
-has_one :purchase


## purchases テーブル

| Column         | Type       | Options                        |
| ---------------|------------| -------------------------------|
| user           | references  | null: false, foreign_key: true |
| content        | references  | null: false, foreign_key: true |


### Association
-belongs_to :user
-belongs_to :content
-has_one :shipping_address


## shipping_addresses

| Column            | Type       | Options                        |
| ------------------|------------| -------------------------------|
| postal_code       | string     | null: false                    |
| area_id           | string     | null: false                    |
| municipality      | string     | null: false                    |
| address           | string     | null: false                    |
| building          | string     |                                |
| telephone_number  | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association
-belongs_to :purchase

