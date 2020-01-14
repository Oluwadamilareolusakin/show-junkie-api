class User < ApplicationRecord
  attr_accessor :password

  validates :email, presence: true
  validates :name, presence: true
  validates :password, presence: true
  has_many :suggestions
  has_many :enquiries
  has_many :comments
end
