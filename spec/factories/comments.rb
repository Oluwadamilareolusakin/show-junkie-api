# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    user
    content { Faker::Lorem.paragraph }
    show { 1 }
  end
end
