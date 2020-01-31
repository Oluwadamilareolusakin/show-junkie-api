# frozen_string_literal: true

class Favourite < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :show_id, presence: true
end
