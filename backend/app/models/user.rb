class User < ApplicationRecord
    # validations
    validates_presence_of :username, :email, :password

    before_save { self.email.downcase! }
end
