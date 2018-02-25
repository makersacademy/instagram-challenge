require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|

  config.fog_provider = 'fog-aws'
  config.fog_credentials = {
    # In Heroku, follow http://devcenter.heroku.com/articles/config-vars
    # $ heroku config:add S3_KEY=your_s3_access_key S3_SECRET=your_s3_secret S3_REGION=eu-west-1 S3_ASSET_URL=http://assets.example.com/ S3_BUCKET_NAME=s3_bucket/folder
 
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
      config.storage = :fog
      config.fog_directory = 'railstagram'

    when 'test'
      config.storage = :file
      config.enable_processing = false
  end

  config.cache_dir = "#{Rails.root}/tmp/uploads"   # To let CarrierWave work on heroku
 

end