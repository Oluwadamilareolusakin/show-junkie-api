# frozen_string_literal: true

FactoryBot.define do
  factory :favourites do
    user
    show_id { 1 }
  end
end
