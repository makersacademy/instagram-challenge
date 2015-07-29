FactoryGirl.define do

  factory :image do
    description 'Fatty'
    picture { File.new(Rails.root.join('app', 'assets', 'images', 'fatty.jpg')) }
  end

end
