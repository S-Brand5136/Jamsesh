FactoryBot.define do
  factory :todo do
    username { Faker::StarWars.character }
    email { Faker::Internet.email }
    password { Faker::StarWars.planet }
  end
end