class Session < ApplicationRecord
  belongs_to :user, dependent: :destroy

    # validations
    validates_presence_of :session_title, :start_date, :start_time, :end_time, :total_spots, :spots_available, :session_title, :user_id
end
