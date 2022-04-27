FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}

    nickname{"ニックネーム"}
    last_name{"名前"}
    first_name{"名前"}
    last_name_kana{"かな"}
    first_name_kana{"かな"}
    birthday{"2000年12月1日"}
  end
end