class Picture < ActiveRecord::Base

  mount_uploader :image, ImageUploader

end
