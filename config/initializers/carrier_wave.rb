require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|

  config.fog_provider = 'fog-aws'
  config.fog_credentials = {
    # Configuration for Amazon S3
    provider: 'AWS',
    aws_access_key_id: ENV['S3_KEY'] || Figaro.env.aws_access_key_id,
    aws_secret_access_key: ENV['S3_SECRET'] || Figaro.env.aws_secret_access_key,
    region: 'eu-west-2'
  }

  case Rails.env
    when 'production'
      config.storage = :fog
      config.fog_directory = 'railstagram'

    when 'development'
      config.storage = :file
      config.enable_processing = false

    when 'test'
      config.storage = :file
      config.enable_processing = false
  end

  config.cache_dir = "#{Rails.root}/tmp/uploads"   # To let CarrierWave work on heroku
 

end