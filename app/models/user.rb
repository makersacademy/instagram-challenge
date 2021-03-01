# email: string
# password_digest: string

# password: string virtual
# password_confirmation: string virtual

class User < ApplicationRecord
    has_many :posts

    has_secure_password

    validates :email, presence: true, uniqueness: {
        # object = person object being validated
        # data = { model: "Person", attribute: "Username", value: <username> }
        message: ->(object, data) do
          "#{data[:value]} already exists. Please enter a new email address"
        end
      }, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: 'Must be a valid email address' }
end
