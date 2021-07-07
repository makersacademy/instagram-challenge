# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
Paperclip.options[:command_path] = "/usr/local/bin/"
run Rails.application
