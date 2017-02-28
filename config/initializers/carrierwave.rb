require 'fog'
CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
    config.root = "#{Rails.root}/tmp"
  else
    config.fog_provider = "fog/rackspace/storage"
    config.fog_credentials = {
      provider:           'Rackspace',
      rackspace_username: ENV.fetch('RS_NAME'),
      rackspace_api_key:  ENV.fetch('RS_KEY'),
      rackspace_region:   :iad
    }
    config.fog_directory = ENV.fetch('RS_DIR')
  end
end
