require 'rails_helper'

RSpec.describe Picture, type: :model do

testjinn = Picture.create(image: File.open(File.join(Rails.root + 'app/assets/images/dancing-jinn-satans.jpg')),
                    caption: "Test Jinn Picture")

  context('it is created with') do
    it ('a caption') do
      expect(testjinn.caption).to eq "Test Jinn Picture"
    end

    it ('an image from a file') do
      expect(testjinn.image.filename).to eq "dancing-jinn-satans.jpg"
    end

  end
end
