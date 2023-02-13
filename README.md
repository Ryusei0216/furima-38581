# テーブル設計

## users テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| email              | string       | null: false, unique: true      |
| encrypted_password | string       | null: false                    |
| nickname           | string       | null: false                    |
| first_name         | string       | null: false                    |
| last_name          | string       | null: false                    |
| first_name(kana)   | string       | null: false                    |
| last_name(kana)    | string       | null: false                    |
| date_of_birth      | date         | null: false                    |

### Association

- has_many : items
- has_many : purchase_records

## items テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| item_name          | string       | null: false                    |
| description        | text         | null: false                    |
| user               | references   | null: false, foreign_key: true |
| price              | integer      | null: false                    |
| category_id        | integer      | null: false                    |
| status_id          | integer      | null: false                    |
| charge_id          | integer      | null: false                    |
| area_id            | integer      | null: false                    |
| dates_id           | integer      | null: false                    |

### Association

- belongs_to : user
- belongs_to : purchase_record

## purchase_records テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| user               | references   | null: false, foreign_key: true |
| item               | references   | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : item
- has_one    : shipping_address

## shipping_addresses テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| postal_code        | string       | null: false                    |
| prefecture_id      | integer      | null: false                    |
| municipalities     | string       | null: false                    |
| house_number       | string       | null: false                    |
| building           | text         |                                |
| phone_number       | text         | null: false                    |

### Association

- belongs_to : purchase_record
