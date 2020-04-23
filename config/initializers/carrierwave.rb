CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'  
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],                        # required unless using use_iam_profile
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY_ID'],                        # required unless using use_iam_profile
  }
 
  config.fog_directory = ENV['FOG_DIRECTORY']

  
end
