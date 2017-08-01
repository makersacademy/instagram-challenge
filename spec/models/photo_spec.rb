require 'rails_helper'

RSpec.describe Photo, type: :model do

  before(:each) { @photo = Photo.create(name: 'Yosemite', image: "http://t.wallpaperweb.org/wallpaper/nature/1600x1200/Half_Dome_From_Olmstead_Point_Yosemite_National_Park_California.jpg") }

  it "has a name" do
    expect(@photo.name).to match('Yosemite')
  end
end
