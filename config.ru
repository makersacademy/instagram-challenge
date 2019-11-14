# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
$stdout.sync = true

run Rails.application
