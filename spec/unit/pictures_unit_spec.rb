require 'rails_helper'

describe 'picture upload' do
  context 'picture image and description are added to database' do
    before do
       @pictures = Picture.create(image: File.new('spec/fixtures/image.jpeg'), description: 'London')
    end

    scenario 'uploads image' do
      expect(@pictures.image_file_name).to eq 'image.jpeg'
    end
  end
end
