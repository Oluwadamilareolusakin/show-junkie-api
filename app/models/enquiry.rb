# frozen_string_literal: true

class Enquiry < ApplicationRecord
  belongs_to :user
  validates :message, presence: true
end
