FactoryGirl.define do
  factory :photo do
    description 'Testing'
    image File.new("#{Rails.root}/spec/support/fixtures/images/testing.png")
    user
  end
end
