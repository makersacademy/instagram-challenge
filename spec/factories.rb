FactoryGirl.define do  factory :endorsement do
    review nil
  end

  factory :user do
    email 'user@email.com'
    password 'password1234'
    password_confirmation { "#{password}" }
  end

  # factory :restaurant do
  #   name 'KFC'
  #   rating 3
  #   association :user
  # end
  #
  # factory :review do
  #   thoughts 'so so'
  #   rating 3
  #   association :user
  #   association :restaurant
  # end
end
