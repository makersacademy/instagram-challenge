FactoryBot.define do
  factory :picture do
    img_link { "MyString" }
    likes { 1 }
    liked { false }
    created_by { "MyString" }
  end
end
