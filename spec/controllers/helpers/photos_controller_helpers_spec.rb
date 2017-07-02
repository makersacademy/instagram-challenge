def upload_file
    Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, 
    'spec', 'support', 'images', 'test_image.png')))
end

def most_recent_photo
    Photo.order("created_at").last
end