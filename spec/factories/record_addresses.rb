FactoryBot.define do
  factory :record_address do
    postal_code     {'123-4567'}
    prefecture_id   {2}
    municipalities  {'東京都'}
    house_number    {'1-1'}
    building        {'東京ハイツ'}
    phone_number    {'09033333333'}
    token {"tok_abcdefghijk00000000000000000"}
    association :user_id
    association :item_id
  end
end
