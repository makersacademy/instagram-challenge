# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
Paperclip.options[:command_path] = "/usr/local/bin/"
