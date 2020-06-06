 CarrierWave.configure do |config|

  if !Rails.env.test?
    config.fog_credentials = {
      :provider               => 'AWS',                             
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],            
      :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],     
      :region                 => 'eu-west-2' 
    }

    config.storage = :fog
    config.permissions = 0666
    config.cache_dir = "#{Rails.root}/tmp"
    config.fog_directory = ENV['FOG_DIRECTORY']
  end
end

# #connection.directories.new(key: blah).files

# CarrierWave.configure do |config|
#   config.storage = :fog


# config.fog_credentials = {
#     :provider               => 'AWS',                             # required
#     :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],            # required
#     :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],     # required
#     :region                 => 'eu-west-2'                        # optional, defaults to 'us-east-1'
#   }
#   config.fog_directory  = ENV['FOG_DIRECTORY'] 
#   config.cache_dir = "#{Rails.root}/tmp"            # required
#   #config.fog_host       = 'https://assets.example.com'           # optional, defaults to nil
#   #config.fog_public     = false                                  # optional, defaults to true
#   config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
# end