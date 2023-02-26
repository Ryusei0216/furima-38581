FactoryBot.define do
  factory :user do
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    nickname              {'Tanaka'}
    last_name             {'田中'}
    first_name            {'太郎'}
    last_name_kana        {'タナカ'}
    first_name_kana       {'タロウ'}
    date_of_birth         {Faker::Date.birthday}
  end
end