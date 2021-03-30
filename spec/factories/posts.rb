FactoryBot.define do
  factory :post do
    caption { 'Llama' }

    user

    trait :with_image do
      image { Rack::Test::UploadedFile.new('spec/files/images/llama.jpeg', 'llama/jpeg') }
    end
  end
end
