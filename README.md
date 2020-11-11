# DB 設計


## users table

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| nick_name   | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| family_name | string | null: false |
| last_name   | string | null: false |
| family_kana | string | null: false |
| last_kana   | string | null: false |
| birthday    | string | null: false |

### Association

- has_many :items
- has_many :orders

## items table

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| name | string | null: false |
| text | text | null: false |
| category_id | string | null: false |
| status_id | string | null: false |
| burden_id | string | null: false |
| address_id | string | null: false |
| days_id | string | null: false |
| price | string | null: false |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :orders

## orders table

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| item_id | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items

## delivery addresses table

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| order_id | references | null: false, foreign_key: true |
| post | string | null: false |
| prefecture_id |  | null: false |
| town | string | null: false |
| address | string | null: false |
| building | string | null: false |
| tel | string | null: false |

### Association

- belongs_to :orders