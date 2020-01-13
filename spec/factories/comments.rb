FactoryBot.define do
  factory :comment do
    user
    message { Faker::Lorem.paragraph }
  end
end
