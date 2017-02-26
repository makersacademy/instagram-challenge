FactoryGirl.define do
 factory :post do
    caption "Love my new trainers!"
    after :create do |b|
      b.update_column(:image, "/spec/fixtures/avatar.jpg")
    end
  end
end
