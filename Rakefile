# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require 'rubygems'
require 'rake'
require 'rspec/core/rake_task'
require 'coveralls/rake/task'

Rails.application.load_tasks

# desc 'Run RSpec'
# RSpec::Core::RakeTask.new do |t|
#   t.verbose = true
# end
# task default: :spec
Coveralls::RakeTask.new
