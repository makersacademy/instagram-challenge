class Photo < ApplicationRecord
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>", large: "800x800>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end
