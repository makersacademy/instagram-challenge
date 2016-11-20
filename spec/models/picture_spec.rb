require 'rails_helper'

RSpec.describe Picture, type: :model do

  subject(:picture) {described_class.create}

  it "adds an image" do
    File.open('./app/assets/images/duck.jpg') do |f|
      picture.image = f
    end
    picture.save
    expect(picture.image_identifier).to eq("duck.jpg")
  end

  it "adds an optional comment" do
    picture.comment = "Love this image!"
    expect(picture.image_identifier).to eq("Love this image!")
  end

end
