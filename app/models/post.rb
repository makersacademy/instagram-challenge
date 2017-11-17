class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :caption, presence: true
  validates :image, presence: true, file_size: { less_than: 1.megabytes }

  def return_true
    true
  end
end
