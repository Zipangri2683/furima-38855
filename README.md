## usersテーブル

| Column             | Type   | Options     |
| -------------------| -------|-------------|
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :orders

## itemsテーブル

| Column         | Type       | Options                        |
| ---------------| -----------|--------------------------------|
| user           | string     | null: false, foreign_key: true |
| name           | references | null: false                    |
| description    | text       | null: false                    |
| price          | integer    | null: false                    |
| category       | string     | null: false                    |
| item_status    | string     | null: false                    |
| shipping_cost  | string     | null: false                    |
| prefecture     | string     | null: false                    |
| scheduled_date | date       | null: false                    |

### Association
- belongs_to :user
- has_one :order

## ordersテーブル

| Column         | Type       | Options                        |
| ---------------| -----------|--------------------------------|
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column      | Type         | Options                        |
| ------------| -------------|--------------------------------|
| orders      | references   | null: false, foreign_key: true |
| postal_code | text         | null: false                    |
| prefecture  | string       | null: false                    |
| city        | string       | null: false                    |
| block       | string       | null: false                    |
| building    | string       |                                |
| tel         | string       | null: false                    |

### Association
- belongs_to :order

