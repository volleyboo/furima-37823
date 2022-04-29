FactoryBot.define do
  factory :content do
    content {Faker::Lorem.sentence}
    association :user
    association :room

    after(:build) do |content|
      content.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
