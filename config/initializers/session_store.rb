if Rails.env === 'production' 
  Rails.application.config.session_store :cookie_store, 
  key: '_procrastagram', domain: 'procrastagram-json-api'
else
  Rails.application.config.session_store :cookie_store, 
  key: '_procrastagram'
end