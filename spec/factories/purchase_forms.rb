FactoryBot.define do
  factory :purchase_form do
    postal_code { '123-4567' }
    area_id { 2 }
    municipality { '東京都' }
    address { '1-1' }
    building { '' }
    telephone_number { 11111111111 }
    user_id { 1 }
    content_id { 1 }
  end
end
