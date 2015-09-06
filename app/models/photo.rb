class Photo < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", large: "800x600>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
