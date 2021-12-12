# CarrierWave.configure do |config|
#   config.fog_credentials = {
#     provider:             'AWS',
#     aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
#     aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
#     region:                ENV['AWS_REGION']
#   }
#   config.storage = :fog
#   config.permissions = 0666
#   config.cache_dir = "#{Rails.root}/tmp/"
#   config.fog_directory = ENV['FOG_DIRECTORY']
#   config.fog_attributes = { 'Cache-Control' => "max-age={365.day.to_i}" }
#   # config.directory_permissions = 0777
#   # config.storage = :file
# end

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider              => 'AWS',
    :aws_access_key_id     =>  ENV['AWS_ACCESS_KEY_ID'],
    :aws_secret_access_key =>  ENV['AWS_SECRET_ACCESS_KEY'],
    :region                =>  ENV['AWS_REGION']
  }
  config.storage = :fog
  config.permissions = 0666
  config.cache_dir = "#{Rails.root}/tmp/"
  config.fog_directory = ENV['FOG_DIRECTORY']
  config.fog_attributes = { 'Cache-Control' => "max-age={365.day.to_i}" }
  # config.directory_permissions = 0777
  # config.storage = :file
end
