# frozen_string_literal: true

class Enquiry < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :message, presence: true
end
