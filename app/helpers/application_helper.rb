module ApplicationHelper
  require 'net/scp'
  require 'net/http'

  def initiate_scp(local_filepath, remote_filepath, type)
    Net::SCP.upload!(ENV["CDN_IP"], ENV["CDN_USERNAME"],
    local_filepath, "/var/www/html/#{type}/#{remote_filepath}",
    ssh: { password: ENV["PASSWORD"] })
    FileUtils.rm_rf("#{Dir.pwd}" + "/public/system/posts/")
    Net::SSH.start(ENV["CDN_IP"], ENV["CDN_USERNAME"], password: ENV["PASSWORD"]) do |ssh|
      ssh.exec "chmod 444 /var/www/html/#{type}/#{remote_filepath}"
    end
  end

  def get_unique_remote_filename(type, pre_filename_to_check, filename_extension_to_check)
    uri = URI("http://#{ENV["CDN_IP"]}/#{type}/#{pre_filename_to_check}.#{filename_extension_to_check}")
    # Do a HTTP Request on this URI
    res = Net::HTTP.get_response(uri)
    # If the response from the HTTP Request = 404, continue on (if file does not exist), otherwise...
    if res.code == "200"
      # Set variables for loop
      i = 1 # File increment
      code = "1" # Set response code to arbitrary value
      until code == "404" # i.e. not found
        # Concat pre_file_name with file counter, i.e. image1
        pre_filename_to_check = pre_filename_to_check.gsub(/ *\d+$/, '') + i.to_s
        # Set URI, to server_location/concat_pre_file_name.pre_file_name_extension
        uri = URI("http://#{ENV["CDN_IP"]}/#{type}/#{pre_filename_to_check}.#{filename_extension_to_check}")
        # Get response
        res = Net::HTTP.get_response(uri)
        i += 1
        code = res.code
      end
    end
    return "#{pre_filename_to_check}.#{filename_extension_to_check}"
  end
end
