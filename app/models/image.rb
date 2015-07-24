class Image < ActiveRecord::Base
  has_attached_file :picture
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\z/
end
