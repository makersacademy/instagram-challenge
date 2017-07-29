class User < ApplicationRecord

  has_many :pictures

  validates :username, presence: true, uniqueness: true, length: { maximum: 50 }

end
