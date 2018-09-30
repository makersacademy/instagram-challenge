class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  # has_attached_file :image

  def convert_time
    created_at.strftime("%B %e, %Y at %I:%M %p")
  end

end
