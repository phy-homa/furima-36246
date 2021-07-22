FactoryBot.define do
  factory :item do
    name               {Faker::Lorem.word}
    description        {Faker::Lorem.sentence}
    category_id        {3}
    status_id          {3}
    shipping_bearer_id {3}
    prefecture_id      {3}
    delivery_days_id   {3}
    price              {3000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
