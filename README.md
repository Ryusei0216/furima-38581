# テーブル設計

## users テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| email              | string       | null: false, unique: true      |
| encrypted_password | string       | null: false                    |
| nickname           | string       | null: false                    |
| name               | string       | null: false                    |
| name(kana)         | string       | null: false                    |
| date_of_birth      | string       | null: false                    |

### Association

- has_many : items
- has_many : purchase_records

## items テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| image              | image        | null: false                    |
| item_name          | string       | null: false                    |
| description        | text         | null: false                    |
| sell_user          | references   | null: false, foreign_key: true |
| price              | string       | null: false                    |
| category           | string       | null: false                    |
| status             | string       | null: false                    |
| charge             | string       | null: false                    |
| area               | string       | null: false                    |
| dates              | string       | null: false                    |

### Association

- belongs_to : user
- belongs_to : purchase_record
- has_one    : shipping_address

## purchase_records テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| purchase_user      | references   | null: false, foreign_key: true |
| item_name          | references   | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : item
- has_many   : shipping_addresses

## shipping_addresses テーブル

| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| postal_code        | string       | null: false                    |
| prefectures        | text         | null: false                    |
| municipalities     | text         | null: false                    |
| house_number       | text         | null: false                    |
| building           | text         | null: false                    |
| phone_number       | test         | null: false                    |

### Association

- belongs_to : user
- belongs_to : item
- belongs_to : purchase_record
