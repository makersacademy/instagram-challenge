class User < ActiveRecord::Base
  validates :username, presence: true, :uniqueness => {
    :case_sensitive => false
  }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :posts, dependent: destroy

end
