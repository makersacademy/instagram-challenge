require 'rails_helper'

RSpec.describe Photo, type: :model do
  before(:each) do
    @photo = create(:photo)
  end
  
  it "Has a title" do
    expect(@photo.title).to eq "Test Photo"
  end

  it "Has a file_location" do
    expect(@photo.image_file.filename).to eq "test_image.png"
  end
end
