include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :post do # FactoryGirl will assume that the parent model of a factory named ":user" is "User".
    caption "this is a caption"
    image { fixture_file_upload(Rails.root.join('spec', 'files', 'images', 'burrito.jpg'), 'image/png') }
  end

end
