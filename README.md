# テーブル設計

## Usersテーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| encrypted_password    | string  | null: false |
| first_name            | string  | null: false |
| last_name             | string  | null: false |
| first_name_kana       | string  | null: false |
| last_name_kana        | string  | null: false |
| birth_date            | integer | null: false |


### Association

- has_many :products
- has_many :purchases


## Productsテーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| name               | string  | null: false                    |
| description        | text    | null: false                    |
| category_id        | integer | null: false                    |
| status_id          | integer | null: false                    |
| shipping_bearer_id | integer | null: false                    |
| prefecture_id      | integer | null: false                    |
| delivery_days_id   | integer | null: false                    |
| price              | integer | null: false                    |
| user_id            | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase


## Purchasesテーブル

| Column     | Type    | Options                        |
| ---------- | ------- | ------------------------------ |
| user_id    | integer | null: false, foreign_key: true |
| tel        | string  | null: false                    |
| product_id | integer | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
- belongs_to :mailing


## Mailingsテーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| prefecture_id | integer | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building      | string  | null: false |

### Associationテーブル

- belongs_to :purchase