class Image < ApplicationRecord
  validates :title, presence: true
  has_attached_file :image, :styles => { :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment :image, presence: true, content_type: { content_type: /\Aimage\/.*\Z/}
end
