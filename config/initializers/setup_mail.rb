ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              =>  'smtp.sendgrid.net',
  :port                 =>  '587',
  :authentication       =>  :plain,
  :user_name            =>  'app116850291@heroku.com',
  :password             =>  'fhawzrxz4815',
  :domain               =>  'heroku.com',
  :enable_starttls_auto  =>  true
}
