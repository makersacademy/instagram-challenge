FactoryGirl.define do
  factory :photo do
    title "Test Photo"

    # after :create do |b|
    #   b.update_column(:file_location, "test_image.png")
    # end
    image_file { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, 'spec', 'support', 'images', 'test_image.png'))) }
  end
end