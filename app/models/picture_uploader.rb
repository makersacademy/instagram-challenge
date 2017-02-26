class PictureUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave unless Rails.env.test?
  
  DEFAULT_WIDTH = 350
  DEFAULT_HEIGHT = 400
  DEFAULT_CROP_MODE = :limit
  
  process :convert => 'png'
  process :tags => ['post_picture']
  
  if Rails.env.test?
    version :default do
    end
  else
    version :default do
      cloudinary_transformation :transformation => [
        {:width => DEFAULT_WIDTH, :height => DEFAULT_HEIGHT, :crop => DEFAULT_CROP_MODE}, 
      ]
    end
    
    version :thumbnail do
      resize_to_fit(50, 50)
    end
  end
end
