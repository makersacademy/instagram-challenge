require 'rails_helper'
require 'images_controller'

RSpec.describe ImageHelper, :type => :helper do

  describe 'formatted_image_url' do
    it ('returns a formatted image url') do
      image = double(id: 1, image_file_name: "band.png")
      expect(helper.formatted_image_url(image)).to eq("/system/images/images/000/000/001/medium/band.png")
    end

    it ('returns a formatted image url') do
      image = double(id: 10, image_file_name: "band2.png")
      expect(helper.formatted_image_url(image)).to eq("/system/images/images/000/000/010/medium/band2.png")
    end
  end
end
