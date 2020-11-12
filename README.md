# DB 設計

## users table

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| nick_name   | string | null: false |
| email       | string | null: false |
| encrypted_password | string | null: false |
| family_name | string | null: false |
| last_name   | string | null: false |
| family_kana | string | null: false |
| last_kana   | string | null: false |
| birthday    | date | null: false |

### Association

- has_many :items
- has_many :orders

## items table

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| name | string | null: false |
| text | text | null: false |
| category_id | integer | null: false |
| status_id | integer | null: false |
| burden_id | integer | null: false |
| address_id | integer | null: false |
| days_id | integer | null: false |
| price | string | null: false |
| user | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :orders

## orders table

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| item | references | null: false, foreign_key: true |
| user | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :delivery addresses

## delivery addresses table

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| order_id | references | null: false, foreign_key: true |
| post | string | null: false |
| prefecture_id |  | null: false |
| town | string | null: false |
| address | string | null: false |
| building | string | null: true |
| tel | string | null: false |

### Association

- belongs_to :orders
