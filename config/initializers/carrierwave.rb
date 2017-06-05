CarrierWave.configure do |config|
  if Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
      config.enable_processing = false
    end
  end

 if Rails.env.production? || Rails.env.development?
    CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_credentials = {
      provider:              'AWS',                        # required
      aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],                        # required
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],                        # required
      region:                'eu-west-2',                  # optional, defaults to 'us-east-1'
    }
    config.fog_directory  = ENV['S3_BUCKET']                         # required
    config.cache_dir = "#{Rails.root}/tmp/uploads"
    config.fog_public     = true                                        # optional, defaults to true
    config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}" } # optional, defaults to {}
    end
  end

end
