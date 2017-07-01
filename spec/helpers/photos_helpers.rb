module Features
  module PhotosHelpers
    def create_photo
      @photo = Photo.create(name: 'Yosemite', photo_file: "http://t.wallpaperweb.org/wallpaper/nature/1600x1200/Half_Dome_From_Olmstead_Point_Yosemite_National_Park_California.jpg")
    end
  end
end

RSpec.configure do |config|
  config.include Features::PhotosHelpers, type: :feature
end
