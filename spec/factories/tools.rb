FactoryBot.define do
  factory :tool do
    title { Faker::App.name }
    link { Faker::Internet.url }
    description { Faker::Coffee.notes }
    tags { ['db', 'node', 'rest', 'http'] }
  end
end
