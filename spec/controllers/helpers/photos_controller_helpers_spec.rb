def upload_file
    Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, 
    'spec', 'support', 'images', 'test_image.png')))
end