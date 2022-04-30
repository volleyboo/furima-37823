FactoryBot.define do
  factory :content do
    association :user
    
    title{"商品名"}
    explanation{"商品説明"}
    category_id{"2"}
    state_id{"2"}
    charge_id{"2"}
    area_id{"2"}
    days_id{"2"}
    price{"300"}

    after(:build) do |content|
      content.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
