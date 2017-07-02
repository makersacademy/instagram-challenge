class User < ApplicationRecord

    has_secure_password
    has_many :photos, dependent: :destroy

end
