CarrierWave.configure do |config|
    #If you want to use fog you must add in your CarrierWave initializer the following lines
    config.fog_credentials = {
        provider:              'AWS', 
        aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],                       
        aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],      
    }

    config.storage = :fog
    config.permissions = 0666
    config.directory_permissions = 0777
    config.fog_directory = ENV['FOG_DIRECTORY']
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }

  end

 