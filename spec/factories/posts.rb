FactoryGirl.define do
  factory :post do
    description 'Amazing salad!'
    image { File.new("#{Rails.root}/spec/support/fixtures/image-post.jpg") }
  end
end
