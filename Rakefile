# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require 'rubygems'
require 'rake'

Rails.application.load_tasks

begin
  require "rspec/core/rake_task"

  desc "Run all examples"

  RSpec::Core::RakeTask.new(:spec) do |t|
    t.verbose = true
    t.rspec_opts = %w[--color]
    t.pattern = 'spec/**/*_spec.rb'
  end
rescue LoadError
end

begin
  require 'coveralls/rake/task'

  desc "Coveralls"
  Coveralls::RakeTask.new

rescue LoadError
end
