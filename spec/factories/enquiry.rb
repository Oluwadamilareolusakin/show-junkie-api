# frozen_string_literal: true

FactoryBot.define do
  factory :enquiry do
    user
    message { Faker::Lorem.paragraph }
  end
end
