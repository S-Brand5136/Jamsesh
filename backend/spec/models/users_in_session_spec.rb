require 'rails_helper'

RSpec.describe UsersInSession, type: :model do
  # ensure UsersInSession model has a 1:m relationship with the Session and User models
  it { should belong_to(:user) }
  it { should belong_to(:session) }
end
