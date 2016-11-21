class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username,
    :presence => true,
    :uniqueness => {
    :case_sensitive => false
  }
  validate :validate_username
  has_many :pictures
  has_many :comments
  has_many :endorsements
  has_many :liked_pictures, through: :endorsements, source: :picture
  has_many :picture_comments, through: :comments, source: :picture

  attr_accessor :login

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end


  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
     conditions = warden_conditions.dup
     if login = conditions.delete(:login)
       where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
     elsif conditions.has_key?(:username) || conditions.has_key?(:email)
       where(conditions.to_h).first
     end
   end

   def has_liked?(picture)
    liked_pictures.include?(picture)
   end

end
