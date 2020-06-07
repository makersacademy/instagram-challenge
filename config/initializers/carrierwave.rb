 if Rails.env.development? || Rails.env.production?

   CarrierWave.configure do |config|

    config.fog_credentials = {
      :provider               => 'AWS',                             
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],            
      :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],     
      :region                 => 'eu-west-2' 
    }


    config.storage = :fog
    # config.permissions = 0666
    config.cache_dir = "#{Rails.root}/tmp"
    config.fog_directory = ENV['FOG_DIRECTORY']
  end
end

