module Features
  module PhotosHelpers
    def create_photo
      sign_in
      visit 'photos/new'
      fill_in 'Name', with: 'Yosemite'
      fill_in 'Photo file', with: "http://t.wallpaperweb.org/wallpaper/nature/1600x1200/Half_Dome_From_Olmstead_Point_Yosemite_National_Park_California.jpg"
      click_button 'Save Photo'
      @photo = Photo.last
    end
  end
end

RSpec.configure do |config|
  config.include Features::PhotosHelpers, type: :feature
end
