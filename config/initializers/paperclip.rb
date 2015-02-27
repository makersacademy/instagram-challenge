# Paperclip.interpolates(:s3_domain_url) do |att, style| 
# "#{att.s3_protocol}://s3-us-west-2.amazonaws.com/#{att.bucket_name}/#{att.path(style)}"
# end

# Paperclip::Attachment.default_options.merge!(
#   :url => ':s3_domain_url'
# )
Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
# Paperclip::Attachment.default_options[:path] = ":class/:attachment/:id_partition/:style/:filename"
Paperclip::Attachment.default_options[:path] = ":class/:attachment/:filename"
Paperclip::Attachment.default_options[:s3_host_name] = 's3-us-west-2.amazonaws.com'