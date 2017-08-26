class Photo < ApplicationRecord
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }

  validates_attachment :image, :presence => true,
  :content_type => { :content_type => /\Aimage\/.*\Z/ }
end
