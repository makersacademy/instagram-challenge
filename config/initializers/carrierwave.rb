CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.production?
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: ENV['S3_KEY'],
        aws_secret_access_key: ENV['S3_SECRET'],
        region: 'eu-west-2',
    }
    config.fog_directory  = ENV['S3_BUCKET']
    config.storage = :fog
  else
    config.storage = :file
  end
end
