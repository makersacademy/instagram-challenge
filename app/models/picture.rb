class Picture < ActiveRecord::Base
  has_attached_file :image, :styles => {:medium => "640x640>"}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user
  has_many :comments, dependent: :destroy
end
