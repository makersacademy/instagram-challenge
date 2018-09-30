class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :timeoutable,
         :validatable, authentication_keys: [:login]

  validates :username, presence: :true, uniqueness: { case_sensitive: false }

  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  # conditions[:email].downcase! if conditions[:email]
  # where(conditions.to_h).first

  attr_writer :login

  def login
    @login || self.username || self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

end
