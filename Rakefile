# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require 'rspec/core/rake_task'

Rails.application.load_tasks

RSpec::Core::RakeTask.new :spec

task default: [:spec]
