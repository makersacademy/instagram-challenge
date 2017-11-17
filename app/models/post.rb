class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader

  def return_true
    true
  end
end
