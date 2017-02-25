class PictureUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave unless Rails.env.test?

  process :convert => 'png'
  process :tags => ['post_picture']
  
  unless Rails.env.test?
  
    version :standard do
      process :resize_to_fill => [100, 150, :north]
    end
    
    version :thumbnail do
      resize_to_fit(50, 50)
    end
  end
end
