FactoryBot.define do
  factory :post do
    caption { "MyString" }
  end

  factory :user do
    first_name { "Joe" }
    last_name { "Bloggs" }
    username { "JoeyB" }
    email { "joe@gmail.com" }
    password { "password" }
  end

end
