# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  validates :show, presence: true
  validates :content, presence: true
end
