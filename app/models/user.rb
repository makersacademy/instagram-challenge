class User < ActiveRecord::Base
  attr_accessor :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:login]


  has_many :pictures, dependent: :destroy

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validate :validate_username

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    if login
      find_by(["lower(username) = :value OR lower(email) = :value",
        { value: login.downcase }])
    elsif conditions.key?(:username) || conditions.key?(:email)
      find_by(conditions.to_hash)
    end
  end

  def validate_username
    errors.add(:username, :taken) if username_already_present_in_email_column?
  end

  private

  def username_already_present_in_email_column?
    self.class.where(email: username).exists?
  end
end
