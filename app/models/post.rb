class Post < ApplicationRecord
  mount_uploader :picture, PictureUploader
  validates_processing_of :picture
  validate :picture_size_validation

  belongs_to :user
  validates :user_id, presence: true
  has_many :comments, dependent: :destroy

  def posted_at
    created_at.localtime.strftime("%H:%M (%d/%m/%y)")
  end

private
  def picture_size_validation
    errors[:picture] << "should be less than 500KB" if picture.size > 0.5.megabytes
  end
end
