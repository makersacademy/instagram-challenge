FactoryGirl.define do
  factory :post do
    image { File.new("#{Rails.root}/spec/support/fixtures/1.jpg") }
    caption "Dig that hole, forget the sun"
    user
  end
end