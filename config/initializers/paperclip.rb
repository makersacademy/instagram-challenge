require 'paperclip'

Paperclip::Attachment.default_options[:url] = 'http://instamatt.s3.amazonaws.com/'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
