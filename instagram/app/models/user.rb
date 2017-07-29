class User < ApplicationRecord

  has_many :pictures

  validates :username, presence: true

end
