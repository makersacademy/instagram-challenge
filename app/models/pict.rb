class Pict < ApplicationRecord
  has_attached_file :image
  validates :image, presence: true
  validates :title, presence: true

  validates_attachment_content_type :image, :content_type =>
    /\Aimage\/.*\Z/

end
