FactoryBot.define do
  factory :item do
    name               {Faker::Lorem.word}
    description        {Faker::Lorem.sentence}
    category_id        {"3"}
    status_id          {"3"}
    shipping_bearer_id {"3"}
    prefecture_id      {"3"}
    delivery_days_id   {"3"}
    price              {"30000"}
    association :user
  end
end
