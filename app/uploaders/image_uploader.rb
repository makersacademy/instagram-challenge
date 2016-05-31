# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  # Comment out the storage and store_dir as we aren't using local storage, but Cloudinary
  # storage :file
  # storage :fog

  # def store_dir
  #   "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  # end

  # Create different versions of your uploaded files:
  version :display do
    process :eager => true
    process :resize_to_fit => [500, 500, :north]
  end

  version :thumbnail do
    process :eager => true
    process :resize_to_fill => [150, 150]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
