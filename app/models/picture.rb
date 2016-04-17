class Picture < ActiveRecord::Base
  has_attached_file :image, styles: { :medium => "640x" }

  validates :image, presence: true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
