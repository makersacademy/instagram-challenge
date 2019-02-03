class Post < ApplicationRecord

  has_one_attached :image

  validate :check_file_presence

  def check_file_presence
    errors.add(:image, "No file added") unless image.attached?
  end


end
