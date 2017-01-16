class Photo < ApplicationRecord

  validates :user_id, presence: true

  has_attached_file :image, :styles => { :medium => "640x640>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :comments, dependent: :destroy
  belongs_to :user

end
