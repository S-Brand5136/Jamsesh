require 'rails_helper'

RSpec.describe Session, type: :model do
  # ensure Session model has a 1:1 relationship with the User model
  it { should belong_to(:user).dependent(:destroy) }

  # Validation Tests
  # ensure all columns are present
  it { should validate_presence_of(:session_title) }
  it { should validate_presence_of(:spots_available) }
  it { should validate_presence_of(:total_spots) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time) }
end
