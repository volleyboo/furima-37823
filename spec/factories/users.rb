FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}

    nickname{"ニックネーム"}
    last_name{"名前"}
    first_name{"名前"}
    last_name_kana{"カナ"}
    first_name_kana{"カナ"}
    birthday{"2022-01-01"}
  end
end