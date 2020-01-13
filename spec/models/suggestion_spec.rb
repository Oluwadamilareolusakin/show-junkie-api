require 'rails_helper'

RSpec.describe Suggestion, type: :model do
  it { should validate_presence_of(:message) }
  it { should belong_to(:user) }
end
