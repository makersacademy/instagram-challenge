begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

RSpec::Core::RakeTask.new(:spec)
task :default => :spec