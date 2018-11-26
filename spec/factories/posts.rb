# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    caption { "MyString" }
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/images/ArmyRyan.jpg', 'image/jpg')
  end
end
