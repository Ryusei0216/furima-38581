FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    nickname              {Faker::Name.name}
    last_name             {Faker::Name.unique.last_name}
    first_name            {Faker::Name.unique.first_name}
    last_name_kana        {Faker::Name.unique.last_name}
    first_name_kana       {Faker::Name.unique.first_name}
    date_of_birth         {Faker::Date.birthday}
  end
end