class Favourite < ApplicationRecord
  belongs_to :user
  validates :show_id, presence: true
end
