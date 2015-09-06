FactoryGirl.define do
  factory :picture do
    caption 'Awesome narwhal'
    image_file_name 'spec/assets/images/image01.png'
  end

  factory :user do
    email 'james@test.com'
    username 'james'
    password '12345678'
    password_confirmation '12345678'
  end
end