FactoryBot.define do
  factory :users_in_session do
    user_id { Faker::Number.number(digits: 2) }
    session_id { Faker::Number.number(digits: 2) }
    association :user, factory: :user
    association :session, factory: :session
  end
end