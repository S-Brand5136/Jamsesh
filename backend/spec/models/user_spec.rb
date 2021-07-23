require 'rails_helper'

RSpec.describe User, type: :model do
  # Validation Tests
  # ensure all columns are present
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
end
