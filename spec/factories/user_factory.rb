FactoryGirl.define do

  factory :user do
    email 'foo@bar.com'
    password 'secret1234'
  end

  factory :user2, class: User do
    email 'foo2@bar.com'
    password 'secret4321'
  end

  factory :user3, class: User do
    email 'foo3@bar.com'
    password 'secret3333'
  end

end
