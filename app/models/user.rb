class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :likes

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates :username,
            :presence => true,
            :uniqueness => {
            :case_sensitive => false
              }

  validate :validate_username

  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true


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


  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

end
