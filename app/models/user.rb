class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :user_name, presence: true, uniqueness: true, length: { minimum: 4, maximum: 16 }

  has_many :pictures, dependent: :destroy
  has_many :comments
  has_many :commented_pictures, through: :comments, source: :picture
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_attached_file :image, :styles => { :medium => "300x300#", :profile => "150x150#", :thumb => "50x50#" }, :default_url => "/images/:style/missing.png"
validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
