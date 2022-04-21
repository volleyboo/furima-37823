# テーブル設計

## users テーブル

| Column              | Type    | Options      |
| --------------------|---------| -------------|
| nickname            | string  | null: false  |
| email               | string  | null: false  |
| encrypted_password  | string  | null: false  |
| name                | string  | null: false  |
| birthday            | string  | null: false  |

### Association

-has_many :contents
-has_many :purchases


## contents テーブル

| Column            | Type       | Options                        |
| ------------------|------------| -------------------------------|
| title             | string     | null: false                    |
| text              | string     | null: false                    |
| detail            | string     | null: false                    |
| delivery          | string     | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |
| purchase          | references | null: false, foreign_key: true |

### Association
-belongs_to :user
-belongs_to :purchase


## purchases テーブル

| Column            | Type       | Options                        |
| ------------------|------------| -------------------------------|
| comment           | text       | null: false                    |
| user              | reference  | null: false, foreign_key: true |


### Association
-belongs_to :user
-has_many :contents
-belongs_to :shipping_address


## shipping_address

| Column            | Type       | Options     |
| ------------------|------------| ------------|
| credit_card_data  | string     | null: false |
| user              | string     | null: false |

### Association
-belongs_to :purchase
