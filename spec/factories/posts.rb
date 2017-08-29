FactoryGirl.define do
  factory :post do
    user { create(:user)}
    caption "MyString"
  end
end
