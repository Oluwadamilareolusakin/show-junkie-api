require 'rails_helper'

RSpec.describe Enquiry, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:message) }
end