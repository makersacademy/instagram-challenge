include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :picture do
    image { fixture_file_upload( File.join(Rails.root, 'spec', 'fixtures', 'images', 'ruby.png'), 'image/png') }
  end
end
