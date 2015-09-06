FactoryGirl.define do
  factory :photo do
    caption "Lazy cat"
    image { File.new(Rails.root.join('spec', 'assets_spec', 'images', 'cat.png')) }
  end
end