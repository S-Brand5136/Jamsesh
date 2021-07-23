FactoryBot.define do
  factory :session do
    user_id { Faker::Number.number(10) }
    session_title { Faker::StarWars.call_sign }
    spots_available { Faker::Number.number(10) }
    total_spots { Faker::Number.number(10) }
    start_date { Faker::Date.backward(days: rand(8)) }
    start_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }
    end_time { Faker::Time.between(from: DateTime.now, to: DateTime.now + 3) }
  end
end