# frozen_string_literal: true

class Suggestion < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :message, presence: true
end
