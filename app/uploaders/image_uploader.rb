class ImageUploader < CarrierWave::Uploader::Base
  storage :gcloud
end
