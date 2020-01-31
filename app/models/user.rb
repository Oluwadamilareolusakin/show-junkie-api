# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  before_save :downcase_email

  validates :email, presence: true
  validates :name, presence: true
  validates :password, presence: true
  has_many :suggestions, dependent: :destroy
  has_many :enquiries, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favourites, dependent: :destroy

  def downcase_email
    email.downcase!
  end
end
