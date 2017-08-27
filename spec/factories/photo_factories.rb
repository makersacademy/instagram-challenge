FactoryGirl.define do
  factory :photo do |photo|
    photo.description "Emily plays chess"
    photo.image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'chess.JPG'), 'image/png')
    user
  end

  factory :like do
    photo
    user
  end

  factory :comment do |comment|
    comment.text "So cute!"
    photo
    user
  end
end
