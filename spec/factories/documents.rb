FactoryBot.define do
  factory :document do
    title { Faker::Lorem.words(number: 10) }
    rich_text { Faker::Lorem.paragraphs }
  end
end
