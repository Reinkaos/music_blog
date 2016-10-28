FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    password 'password'
    password_confirmation 'password'

    factory :invalid_user do
      name nil
      password nil
    end
  end
end
