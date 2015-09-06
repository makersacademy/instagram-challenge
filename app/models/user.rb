class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, :presence => true,
            :uniqueness => {:case_sensitive => false}

  has_many :pictures

end
