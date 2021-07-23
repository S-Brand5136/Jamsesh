FactoryBot.define do
  factory :users_in_session do
    user_id { Faker::Number.number(10) }
    session_id { Faker::Number.number(10) }
  end
end