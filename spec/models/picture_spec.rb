require 'rails_helper'

RSpec.describe Picture, type: :model do

  subject(:picture) {described_class.new}

  it 'can save a picture object to the database' do
    expect{picture.save!}.to change {Picture.count}.by(1)
  end

  it 'can save an image file to the database' do
    File.open (File.expand_path("../../../app/assets/images/Scan0001.jpg", __FILE__)) do |jpg|
      picture.image = jpg
    end
    picture.save!
    expect(picture.image_file_name).to eq "Scan0001.jpg"
  end

end
