FactoryBot.define do
  factory :user do
    nick_name { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { 'u5' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name { '村上' }
    last_name { '玉樹' }
    family_kana { 'ムラカミ' }
    last_kana { 'タマキ' }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2015-01-01') }
  end
end