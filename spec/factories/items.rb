FactoryBot.define do
  factory :item do
    item_name          {'サンプル'}
    description        {'サンプル'}
    price              {9999}
    category_id        {2}
    status_id          {2}
    charge_id          {2}
    prefecture_id      {2}
    day_id             {2}
    association :user
  end
end
