def basic_image
  Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/assets/dog.jpg')))
end
