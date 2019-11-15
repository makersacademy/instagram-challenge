class Picture < ApplicationRecord
  # has_attached_file :image, styles: { :medium => "640x" }
  has_one_attached :image

  validates :image, presence: true

  # validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :image, file_content_type: {
        allow: ["image/jpeg", "image/png"],
        if: -> { image.attached? },
  }

end
