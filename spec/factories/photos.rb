FactoryGirl.define do
  factory :photo do
    description 'Testing'
    image File.new("#{Rails.root}/spec/support/fixtures/images/testing.png")
    association :user, strategy: :build
  end
end
