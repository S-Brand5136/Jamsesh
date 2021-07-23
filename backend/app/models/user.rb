class User < ApplicationRecord
    belongs_to :users_in_session, dependent: :destroy

    # validations
    validates_presence_of :username, :email, :password
end
