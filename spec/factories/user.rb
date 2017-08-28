FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "oscar#{n}@wao.com"
    end
    name "Oscar"
    username "oscarwao"
		bio "'The next J.R.R. Tolkien"
		password "123456"
  end
end
