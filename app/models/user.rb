class User < ApplicationRecord
  has_many :comments

  validates :name, presence: true
  validates :email, presence: true
end
