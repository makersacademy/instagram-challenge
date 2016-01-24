
include ActionDispatch::TestProcess

FactoryGirl.define do 
    

  factory :hipstergram do
    image { fixture_file_upload(Rails.root.join('spec', 'photos', 'test.jpg'), 'image/jpg') }
  end


  factory :hipster do
    email "test@test.com"
    password 12345678
    password_confirmation 12345678
    hipstername "Horatio"
  end


end
