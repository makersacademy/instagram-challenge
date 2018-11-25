require 'carrierwave'
require 'fileutils'

carrierwave_template = Rails.root.join('spec','fixtures', 'files')
carrierwave_root = Rails.root.join('spec', 'support', 'carrierwave')
CarrierWave.configure do |config|
  config.root = carrierwave_root
  config.enable_processing = false
  config.storage = :file
  config.cache_dir = Rails.root.join('spec', 'support', 'carrierwave', 'carrierwave_cache')
end
# FileUtils.cp_r carrierwave_template.join('uploads'), carrierwave_root
at_exit do
  Dir.glob(carrierwave_root.join('*')).each do |dir|
    FileUtils.remove_entry(dir)
  end
end
