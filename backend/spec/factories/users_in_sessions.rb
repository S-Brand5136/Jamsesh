FactoryBot.define do
  factory :todo do
    user_id { Faker::Number.number(10) }
    session_id { Faker::Number.number(10) }
  end
end