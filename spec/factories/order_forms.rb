FactoryBot.define do
  factory :order_form do
    token { 'tok_abcdefghijk00000000000000000' }
    post { '123-4567' }
    prefecture_id { 2 }
    town { '豊島区' }
    address { '1-1' }
    building { '東京ハイツ' }
    tel { '09012345678' }
  end
end