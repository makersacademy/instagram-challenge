require 'fileutils'

def image_upload
	Rails.root + "spec/fixtures/test.png"
end

def remove_uploaded_file
	FileUtils.rm_rf(Rails.root + "public/system")
end