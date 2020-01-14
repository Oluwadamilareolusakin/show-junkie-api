class User < ApplicationRecord
  validates :email, presence: true
  validates :name, presence: true
  has_many :suggestions
  has_many :enquiries
  has_many :comments
end
