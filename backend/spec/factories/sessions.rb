FactoryBot.define do
  factory :session do
    user_id { 1 }
    session_title { Faker::Movies::StarWars.call_sign }
    spots_available { Faker::Number.number(digits: 2) }
    total_spots { Faker::Number.number(digits: 2) }
    start_date { Faker::Date.backward(days: rand(8)) }
    start_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
    end_time { Faker::Time.between(from: DateTime.now, to: DateTime.now + 3) }
    association :user, factory: :user
  end
end