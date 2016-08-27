Rails.application.configure do

  # config.paperclip_defaults = {
  # :storage => :s3,
  # :s3_credentials => {
  #   :bucket => ENV['S3_BUCKET_NAME'],
  #   :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
  #   :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
  #   }
  # }

  config.cache_classes = true
  config.eager_load = false
  config.serve_static_files   = true
  config.static_cache_control = 'public, max-age=3600'
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_dispatch.show_exceptions = false
  config.action_controller.allow_forgery_protection = false
  config.action_mailer.delivery_method = :test
  config.active_support.test_order = :random
  config.active_support.deprecation = :stderr
end
