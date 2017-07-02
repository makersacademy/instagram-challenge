require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = create(:user)
  end
  
  it "Has a title" do
    expect(@user.display_name).to eq "Test_User"
  end

  it "Has an email" do
    expect(@user.email).to eq "test@email.com"
  end

  it "Has Photos" do
    @user.photos.create({title: "Test Photo", image_file:  Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, 'spec', 'support', 'images', 'test_image.png'))) })
    expect(@user.photos[0].title).to eq "Test Photo"
  end

end
