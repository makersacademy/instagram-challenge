# include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :post do |f|
    f.sequence(:caption) { |n| "cheeky monkey#{n}" }
    # image { fixture_file_upload 'test.png', 'image/png' }
  end
end
