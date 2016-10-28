FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.word }
    body { Faker::Lorem.sentence }

    factory :invalid_post do
      title nil
      body  nil
    end
  end
end
