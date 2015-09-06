class Photo < ActiveRecord::Base
  belongs_to :user
  has_attached_file :picture
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\z/
end
