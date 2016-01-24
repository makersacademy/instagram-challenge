require 'rubygems'
require 'fog'

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => "AWS",
    :aws_access_key_id      => ENV['AWS_ACCESS_ID'],
    :aws_secret_access_key  => ENV['AWS_SECRET_KEY']
  }

  config.fog_directory  = "instagramchallenge-dev"
  config.fog_public     = false
end
