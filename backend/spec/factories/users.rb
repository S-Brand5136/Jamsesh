FactoryBot.define do
  factory :user do
    username { Faker::Movies::StarWars.character }
    email { Faker::Internet.email }
    password { Faker::Movies::StarWars.planet }
  end
end