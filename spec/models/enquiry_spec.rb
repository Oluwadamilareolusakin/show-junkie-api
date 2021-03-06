# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Enquiry, type: :model do
  it { should validate_presence_of(:message) }
  it { should belong_to(:user) }
end
