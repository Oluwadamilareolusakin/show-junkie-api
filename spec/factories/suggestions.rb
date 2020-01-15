# frozen_string_literal: true

FactoryBot.define do
  factory :suggestion do
    user
    message { Faker::Lorem.paragraph }
  end
end
