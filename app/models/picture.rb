class Picture < ActiveRecord::Base

  has_attached_file :picture, styles: {thumb: "300x300>"}
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

end
