FactoryBot.define do
  factory :user do
    username { "test" }
    email { "test@com" }
    password  { "password" }
  end

  factory :post do
    caption { "caption" }
  end
end
