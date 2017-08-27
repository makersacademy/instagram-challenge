FactoryGirl.define do
  factory :user do |user|
    user.username               "dangermouse"
    user.email                  "danger@mouse.com"
    user.password               "penfoldshush"
    user.password_confirmation  "penfoldshush"
  end
end
