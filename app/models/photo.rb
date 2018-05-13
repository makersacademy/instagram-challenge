class Photo < ApplicationRecord
  validates :user_id, presence: true
  belongs_to :user

  mount_uploader :image, ImageUploader
  validates :image, presence: true

  validates_processing_of :image
  validate :image_size_validation

private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end

end
