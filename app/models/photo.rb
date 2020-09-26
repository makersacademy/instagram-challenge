class Photo < ApplicationRecord
  has_one_attached :photo
  validates :photo, presence: true
  validates :photo, allow_blank: true, format: {
    with: %r{\.(gif|jpg|png|jpeg)\Z}i,
    message: 'File must be GIF, JPG or PNG image.'
    }
end
