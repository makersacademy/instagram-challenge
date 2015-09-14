FactoryGirl.define do
  factory :picture do
    title "Smiley Face"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/spec_assets/smiley.png', 'image/png')
  end
end