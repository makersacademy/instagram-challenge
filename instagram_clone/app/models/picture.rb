class Picture < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  has_attached_file :image, :default_url => "/images/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
