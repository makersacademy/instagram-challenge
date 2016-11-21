class Photo < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment_size :image, in: 0..3.megabytes, message: 'File too large'

  has_many :comments, dependent: :destroy
  has_many :likes
  belongs_to :user


end
