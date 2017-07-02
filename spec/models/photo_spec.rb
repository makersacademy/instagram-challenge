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

  it "Has a user" do
    expect(@photo.user.display_name).to eq "Test_User"
  end

end
