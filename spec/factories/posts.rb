FactoryGirl.define do
  factory :post do
    image { File.new("#{Rails.root}/spec/support/fixtures/test_image.png") }
    description 'I can haz rails?'
    user User.new
  end
end
