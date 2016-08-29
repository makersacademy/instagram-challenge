Rails.application.configure do

  config.paperclip_defaults = {
    :storage => :s3,
    :s3_host_name => 's3-eu-west-1.amazonaws.com',
    :s3_credentials => {
      :bucket => ENV['S3_BUCKET_NAME'],
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],
      :s3_region => ENV['AWS_REGION'],
    },
    :url =>':s3_domain_url',
    :path => '/:class/:attachment/:id_partition/:style/:filename'
  }

  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.action_mailer.default_url_options = { host: 'https://kittygram-lucalabs.herokuapp.com'}
  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.assets.digest = true
  config.log_level = :debug
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
  config.active_record.dump_schema_after_migration = false

end
