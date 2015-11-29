# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task :andygram_setup do
  system('bin/rake db:create')
  system('bin/rake db:create RAILS_ENV=test')
  system('bin/rake db:migrate')
  system('bin/rake db:migrate RAILS_ENV=test')
  puts('COMPLETE - you may run tests/run test server')
end
