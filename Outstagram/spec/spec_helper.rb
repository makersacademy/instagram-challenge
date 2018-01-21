require 'database_cleaner'

RSpec.configure do |config|
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
    FileUtils.rm_rf(Dir["#{Rails.root}/public/system/posts/images/000"])
  end

end
