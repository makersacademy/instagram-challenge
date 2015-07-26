class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :photos, 
    -> { extending WithUserAssociationExtension }
  has_many :comments
  has_many :commented_on_photos, through: :comments, source: :photo
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  
 validates :username,
   :presence => true,
   :uniqueness => {
     :case_sensitive => false
   } # etc.
  
  attr_accessor :login
  
  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions.to_hash).first
      end
  end
end
