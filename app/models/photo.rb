class Photo < ActiveRecord::Base
  belongs_to :user

  has_attached_file :gram, styles: { large: "600x600>", med: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :gram, content_type: /\Aimage\/.*\Z/
end
