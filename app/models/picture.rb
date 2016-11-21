class Picture < ApplicationRecord
  belongs_to :user
  belongs_to :gallery
  validates :title, length: { minimum: 1, maximum: 30 }, uniqueness: true

  has_attached_file :image, :styles => {
    :medium => "500x500>" },
    :default_url => "/images/:style/missing.png"
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
