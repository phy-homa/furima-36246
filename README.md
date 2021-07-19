# テーブル設計

## Usersテーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| encrypted_password    | string  | null: false |
| password_confirmation | string  | null: false |
| first_name            | string  | null: false |
| last_name             | string  | null: false |
| first_name_kana       | string  | null: false |
| last_name_kana        | string  | null: false |
| birth_year            | integer | null: false |
| birth_month           | integer | null: false |
| birth_day             | integer | null: false |

### Association

- has_many :products
- has_many :purchases


## Productsテーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| name            | string  | null: false                    |
| description     | text    | null: false                    |
| category        | string  | null: false                    |
| status          | string  | null: false                    |
| shipping_bearer | string  | null: false                    |
| prefecture      | string  | null: false                    |
| delivery_days   | string  | null: false                    |
| price           | integer | null: false                    |
| user_id         | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchase


## Purchasesテーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| tel     | integer | null: false                    |

### Association
- belongs_to :user
- belongs_to :product
- belongs_to :mailing


## Mailingsテーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| postal_code | integer | null: false |
| prefecture  | string  | null: false |
| city        | string  | null: false |
| address     | string  | null: false |
| building    | string  | null: false |

### Associationテーブル

- belongs_to :purchase