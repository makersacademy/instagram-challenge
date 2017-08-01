CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['S3_ACCESS_KEY_ID'],                        # required
    aws_secret_access_key: ENV['S3_ACCESS_KEY'],                        # required
    region:                ENV['S3_REGION'],                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = ENV['S3_BUCKET']
  config.fog_public     = true
  config.fog_attributes = {'Cache-Control' => 'max-age=315576000'}

  if Rails.env.test? || Rails.env.cucumber?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  else
    config.storage = :fog
  end

  config.cache_dir = "#{Rails.root}/tmp/uploads"
end
