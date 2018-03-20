require 'carrierwave/orm/activerecord'

# https://gist.github.com/cblunt/1303386/b47377dfbddd7a29af087a64660464dfd35392d3
# https://gist.github.com/marcusmalmberg/4073144

CarrierWave.configure do |config|

  if Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
    end
  end

  # Use AWS storage if in production
  if Rails.env.production?
    CarrierWave.configure do |config|
      config.storage = :fog
    end
  end

  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:      ENV['S3_KEY'],
    aws_secret_access_key:  ENV['S3_SECRET'],
    region:                 ENV['S3_REGION']
  }
  config.fog_directory  = ENV['S3_BUCKET_NAME']                                   # required
  config.cache_dir      = "#{Rails.root}/tmp/uploads"   # For Heroku
  config.fog_public     = false
  config.s3_access_policy = :public_read
  config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" } # optional, defaults to {}
end
