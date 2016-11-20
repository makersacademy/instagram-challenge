require 'rails_helper'

RSpec.describe Picture, type: :model do

  subject(:picture) {described_class.create(comment: "Love this image!")}

  it "adds an image to the picture" do
    File.open('./app/assets/images/duck.jpg') do |f|
      picture.image = f
    end
    picture.save
    expect(picture.image_identifier).to eq("duck.jpg")
  end

  it "requires an image" do
    picture2 = Picture.new(comment: "Love this image!")
    expect{picture2.save}.not_to change{Picture.count}
  end

  it "adds an optional comment" do
    expect(picture.comment).to eq("Love this image!")
  end

end
