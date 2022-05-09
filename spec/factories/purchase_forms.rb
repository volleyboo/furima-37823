FactoryBot.define do
  factory :purchase_form do
    postal_code { '123-4567' }
    area_id { 2 }
    municipality { '東京都' }
    address { '1-1' }
    building { '柳ビル11' }
    telephone_number { 11111111111 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
