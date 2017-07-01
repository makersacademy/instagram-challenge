require 'rails_helper'

RSpec.feature "User can see photos" do

  before(:each) { @photo = Photo.create(name: 'Yosemite', photo_file: "http://t.wallpaperweb.org/wallpaper/nature/1600x1200/Half_Dome_From_Olmstead_Point_Yosemite_National_Park_California.jpg") }

  scenario "user visits the photos page" do
    sign_in
    visit photos_url
    expect(page).to have_content('Yosemite')
  end
end
