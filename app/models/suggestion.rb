class Suggestion < ApplicationRecord
  belongs_to :user
  validates :message, presence: true
end
